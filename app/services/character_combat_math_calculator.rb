class CharacterCombatMathCalculator
  def initialize(mods:, stats:, base_attack_bonus:, armor_bonus:, shield_bonus:, size_modifier: )
    @mods = mods
    @stats = stats
    @base_attack_bonus = base_attack_bonus
    @armor_bonus = armor_bonus
    @shield_bonus = shield_bonus
    @size_modifier = size_modifier
  end

  def initiative_modifier
    dex_mod
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

  attr_reader :mods, :stats, :base_attack_bonus, :armor_bonus, :shield_bonus, :size_modifier

  def flat_footed_bonus
    mods_bonus_for :flat_footed
  end

  def range_penalty_bonus
    mods_bonus_for :range_penalty
  end

  def armor_class_bonus
    mods_bonus_for :armor_class
  end

  def mods_bonus_for(trait)
    mods.total_bonus_for(trait)
  end

  def dex_mod
    stats.dexterity.modifier
  end

  def str_mod
    stats.strength.modifier
  end
end
