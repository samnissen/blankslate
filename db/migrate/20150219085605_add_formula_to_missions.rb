class AddFormulaToMissions < ActiveRecord::Migration
  def change
    add_reference :missions, :formula, index: true
  end
end
