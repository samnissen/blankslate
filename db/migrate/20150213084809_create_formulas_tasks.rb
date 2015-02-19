class CreateFormulasTasks < ActiveRecord::Migration
  def change
    create_table :formulas_tasks, :id => false do |t|
      t.belongs_to :formula, index: true
      t.belongs_to :task, index: true
    end
  end
end
