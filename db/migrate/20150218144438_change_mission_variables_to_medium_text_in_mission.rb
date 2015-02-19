class ChangeMissionVariablesToMediumTextInMission < ActiveRecord::Migration
  def change
    change_column :missions, :class_code, :text, :limit => 64.kilobytes + 1
    change_column :missions, :variables, :text, :limit => 64.kilobytes + 1
  end
end
