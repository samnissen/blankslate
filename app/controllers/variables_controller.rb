class VariablesController < InheritedResources::Base

  private

    def variable_params
      params.require(:variable).permit(:prompt, :name, :validation_type, :validation, :task_id, :task_type_id)
    end
end

