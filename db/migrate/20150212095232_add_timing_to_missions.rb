class AddTimingToMissions < ActiveRecord::Migration
  def change
    add_column :missions, :interval, :string
    add_column :missions, :recurring, :boolean
  end
end
