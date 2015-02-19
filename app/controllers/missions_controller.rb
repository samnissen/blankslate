class MissionsController < ApplicationController

  #->Prelang (scaffolding:rails/scope_to_user)
  before_filter :authenticate_user!, only: [:index]
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]
  
  before_action :set_mission, only: [:show, :edit, :update, :destroy]
  
  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.where(user: current_user)
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
  end

  # GET /missions/new
  def new
    @mission = Mission.new
    @interface = Interface.find(params[:interface_id])
    
    @task_types = TaskType.all
    @tasks = Task.all
    @formulas = Formula.all
    
    get_variables
  end

  # GET /missions/1/edit
  def edit
  end

  # POST /missions
  # POST /missions.json
  def create
    @interface = Interface.find(params[:interface_id])
    @mission = Mission.new(mission_params)
    @mission.interface = @interface
    
    @mission.user = current_user
    
    @formula = Formula.find(params[:formula_id])
    @mission.formula = @formula
    
    validate_variables
    
    build_code_from_formula
    
    # params.require(:mission).permit(:user_id, :class_name, :class_code, :variables, :interface_id)

    respond_to do |format|
      if @mission.save
        format.html { redirect_to interface_path(@interface), notice: 'Mission was successfully created.' }
        format.json { render :show, status: :created, location: @mission }
      else
        prepare_errors
        format.html { render :new }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missions/1
  # PATCH/PUT /missions/1.json
  def update
    respond_to do |format|
      if @mission.update(mission_params)
        format.html { redirect_to @mission, notice: 'Mission was successfully updated.' }
        format.json { render :show, status: :ok, location: @mission }
      else
        prepare_errors
        format.html { render :edit }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission.destroy
    respond_to do |format|
      format.html { redirect_to missions_url, notice: 'Mission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
      redirect to interfaces_path and return unless is_users?
      @interface = @mission.interface if @mission.interface
    end
    
    def prepare_errors
      nil unless Array(@mission.errors).size > 0
      
      flash[:error] = "<ul>"
      @mission.errors.to_a.each do |err|
        flash[:error] += "<li>#{err}</li>"
      end
      flash[:error] += "</ul>"
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mission_params
      params.require(:mission).permit(:user_id, :variables, :formula_id, :recurring, :interval, :interface_id)
      # params.require(:mission).permit(:user_id, :class_name, :class_code, :variables, :interface_id)
    end
    
    def is_users?
      @mission.user == current_user
    end
    
    def validate_variables
      error_message = nil
      mission_variables = {}
      
      variables = params["mission"].map { |k,v|
        if "#{k}" =~ /^variable_[0-9]{1,2}$/ 
          id = "#{k}".split('_').last
          
          variable_type = Variable.where(id: id.to_i).first
          
          # Protect from invalid variables
          redirect_to new_interface_mission_path(@interface), error: "Invalid variable submitted" and return unless variable_type
          
          {
            id: id,
            value: v,
            name: variable_type.name,
            validation: variable_type.validation,
            validation_type: variable_type.validation_type
          }
        end
      }.compact
      
      variables.each do |v|
        case v[:validation_type]
        when "select_list"
          error_message = "Please make a valid selection." unless v[:validation].split(",").map{ |option| 
            option.strip == v[:value]
          }.any?
          # puts "processed select list for '#{v[:value]}' validation"
        when "text_field"
          # puts "#{v[:value]} =~ eval(v[:validation]) evaluates to #{v[:value] =~ eval(v[:validation])}"
          error_message = "#{v[:value]} is invalid." unless v[:value] =~ eval(v[:validation])
        when "boolean"
          error_message = "Booleans variables are not yet accepted" #; puts error_message
        else
          error_message = "Variable type was not recognized" #; puts error_message
        end
        
        mission_variables[v[:name]] = v[:value] 
      end
      
      puts "before saving, mission_variables is #{mission_variables}"
      
      redirect_to new_interface_mission_path(@interface), error: error_message and return if error_message
      
      @mission.variables = mission_variables.to_json
      
      puts "after variable processing, mission variables is #{@mission.variables}"
    end
    
    def build_code_from_formula
      # Grab the tasks from the formula
      tasks = @formula.tasks
      
      # Grab the task types from the tasks
      task_types = tasks.map{|t| t.task_type }.uniq.compact
      
      # Pull the setup from the task types
      setup_code = task_types.map{|tt| tt.setup }.compact.join("\n\n")
      
      # Pull the teardown from the task types
      teardown_code = task_types.map{|tt| tt.teardown }.compact.join("\n\n")
      
      # Pull the variable setup code submitted and parse it
      variable_code = JSON.parse(@mission.variables).map{|k,v| "\"#{k}\"=\"#{v}\""}.join("\n")
      
      # Create the return value
      return_value_code = "return #{tasks.last.return_value}"
      
      # Pull the task code
      task_code = tasks.map{|t| t.code }.uniq.compact.join("\n")
      
      # Generate a unique class code
      @mission.class_name = "BlankSlateExecute::" + \
        @mission.user.email.split("@")[0].downcase.gsub(/[^a-z]/,'').humanize + \
        SecureRandom.hex(6) + \
        @formula.name.downcase.gsub(/[^a-z]/,'')
      
      @mission.class_code = "class #{@mission.class_name}\n\tdef execute\n" + [
        setup_code, 
        variable_code, 
        task_code, 
        teardown_code, 
        return_value_code
      ].join("\n\n") + "\n\tend\nend"
    end
    
    def get_variables
      @variables_for_input = {}
      
      @formulas.each do |formula|
        key = formula.id
        variables = []
        
        formula.tasks.each do |t|
          task_variables = t.variables
          task_type_variables = t.task_type.variables
          if t == formula.tasks.first
            variables += task_type_variables + task_variables
          else
            variables += task_variables
          end
        end
        
        @variables_for_input[key] = variables
      end
    end
end
