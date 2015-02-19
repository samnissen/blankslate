class RemoveVariablesFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :variables
  end
end
