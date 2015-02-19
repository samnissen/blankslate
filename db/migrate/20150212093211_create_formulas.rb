class CreateFormulas < ActiveRecord::Migration
  def change
    create_table :formulas do |t|
      t.string :name
      t.string :description
      # t.has_many :task

      t.timestamps
    end
  end
end
