class CreateArmory < ActiveRecord::Migration
  def change
    create_table :armories do |t|
      t.belongs_to :character, index: true
      t.string :melee_weapon
      t.string :ranged_weapon
      t.string :shield
      t.string :armor
    end
  end
end
