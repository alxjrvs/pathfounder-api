CharacterCombatMathCalculator = Struct.new(:character) do
  def self.melee_attack_bonus(base_attack_bonus: , size_modifier: , str_mod: )
    base_attack_bonus +
      size_modifier +
      str_mod
  end

  def self.ranged_attack_bonus(base_attack_bonus:, size_modifier:, dex_mod:,range_penalty:)
    base_attack_bonus +
      size_modifier +
      dex_mod +
      range_penalty
  end

  def self.flat_footed(mods_bonus:,armor_bonus:, shield_bonus:)
    mods_bonus +
      armor_bonus +
      shield_bonus +
      10

  end

  def self.armor_class(mods_bonus:, dex_mod:, armor_bonus:, shield_bonus:)
    mods_bonus +
      dex_mod +
      armor_bonus +
      shield_bonus +
      10
  end
end
