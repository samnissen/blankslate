class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :prompt
      t.string :name
      t.string :validation_type
      t.string :validation
      t.belongs_to :task, index: true

      t.timestamps
    end
  end
end
