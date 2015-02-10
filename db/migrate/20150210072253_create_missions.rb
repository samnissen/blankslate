class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.references :user, index: true
      t.string :class_name
      t.string :class_code
      t.string :variables
      t.references :interface, index: true

      t.timestamps
    end
  end
end
