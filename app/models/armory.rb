class Armory < ActiveRecord::Base
  belongs_to :character
  validates :character, presence: true
  validate :armor_is_armor
  validate :shield_is_shield
  validate :weapons_are_weapons

  def add_weapon(name)
    weapon = equipment.construct(name)
    if weapon.family == "Weapons"
      weapon_list << name
      self.save
    else
      false
    end
  end

  private

  def equipment
    @_equipment ||= Equipment.new
  end

  def armor_is_armor
    return true if armor.nil?
    armor_obj = equipment.construct(armor)
    if armor_obj.category != "Armor"
      errors.add(:armor, "Must be a valid armor")
    end
  end

  def shield_is_shield
    return true if shield.nil?
    shield_obj = equipment.construct(shield)
    if shield_obj.subcategory != "Shields"
      errors.add(:shield, "Must be a valid shield")
    end
  end

  def weapons_are_weapons
    return true if weapon_list.empty?
    weapons = weapon_list.map {|w| equipment.construct(w)}
    all_weapons = weapons.all? do |w|
      w.family == "Weapons"
    end
    if !all_weapons
      errors.add(:weapon_list, "Must only contain valid weapons")
    end
  end
end
