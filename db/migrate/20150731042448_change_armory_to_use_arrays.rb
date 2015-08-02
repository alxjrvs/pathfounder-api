class ChangeArmoryToUseArrays < ActiveRecord::Migration
  def change
    remove_column :armories, :melee_weapon
    remove_column :armories, :ranged_weapon
    add_column :armories, :weapon_list, :text, array: true, default: []
  end
end
