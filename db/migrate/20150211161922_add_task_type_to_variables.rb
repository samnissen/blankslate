class AddTaskTypeToVariables < ActiveRecord::Migration
  def change
    add_reference :variables, :task_type, index: true
  end
end
