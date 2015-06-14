class CharacterCombatMathCalculator
  def initialize(character)
    @character = character
  end

  def melee_attack_bonus
    base_attack_bonus +
    size_modifier +
    str_mod
  end

  def ranged_attack_bonus
    range_penalty_bonus +
    base_attack_bonus +
    size_modifier +
    dex_mod
  end

  def armor_class
    armor_class_bonus +
    shield_bonus +
    dex_mod +
    armor_bonus +
    10
  end

  def flat_footed
    flat_footed_bonus +
    armor_bonus +
    shield_bonus +
    10
  end

  private

  attr_reader :character

  def flat_footed_bonus
    mods_bonus_for :flat_footed
  end

  def range_penalty_bonus
    mods_bonus_for :range_penalty
  end

  def armor_class_bonus
    mods_bonus_for :armor_class
  end

  def armor_bonus
    character.armor_bonus
  end

  def shield_bonus
    character.shield_bonus
  end

  def base_attack_bonus
    character.base_attack_bonus
  end

  def mods_bonus_for(trait)
    character.total_modifier_for(trait)
  end

  def dex_mod
    character.dexterity.modifier
  end

  def str_mod
    character.strength.modifier
  end

  def size_modifier
    character.size_modifier
  end
end
