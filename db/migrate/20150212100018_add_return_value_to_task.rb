class AddReturnValueToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :return_value, :string
  end
end
