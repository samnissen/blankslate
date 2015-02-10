class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.string :name
      t.text :setup
      t.text :teardown

      t.timestamps
    end
  end
end
