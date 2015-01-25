class AddAbilityBonusToHuman < ActiveRecord::Migration
  def change
    add_column :humen, :ability_bonus, :string
  end
end
