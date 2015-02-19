class AddFormulaToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :formula, index: true
  end
end
