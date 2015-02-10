class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.text :code
      t.text :variables
      t.references :task_type, index: true

      t.timestamps
    end
  end
end
