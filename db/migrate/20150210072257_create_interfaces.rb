class CreateInterfaces < ActiveRecord::Migration
  def change
    create_table :interfaces do |t|
      t.string :address
      t.string :credentials
      t.references :user, index: true

      t.timestamps
    end
  end
end
