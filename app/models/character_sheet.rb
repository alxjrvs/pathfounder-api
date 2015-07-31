class CharacterSheet

  def initialize(character)
    @character = character
  end

  #TODO: Figure out a better way of seperating these.

  #Cosmetic
  def level
    levels.count
  end

  def name
    character.name
  end

  def alignment
    character.alignment
  end

  #Race
  def race
    return character.race if character.race.present?
    NullRace.new
  end

  def size_modifier
    race.size_modifier
  end

  def size
    race.size
  end

  def speed
    race.speed
  end

  #Class
  def favored_class
    return levels.first.pf_class if levels.first.present?
    NullPfClass.new
  end

  def skill_ranks_per_level
    favored_class.skill_ranks_per_level
  end

  def hit_die
    favored_class.hit_die
  end

  def base_attack_bonus
    favored_class.base_attack_bonus
  end

  #Calculators
  def stats
    @_stats ||= StatCalculator.new stat_block: stat_block, mods: modifier_engine
  end

  def skills
    @_skills ||= SkillCalculator.new skill_list, stats, modifier_engine, armor_check_penalty, class_skills
  end

  def combat
    @_combat ||= CharacterCombatMathCalculator.new(
      mods: modifier_engine,
      stats: stats,
      base_attack_bonus: base_attack_bonus,
      armor_bonus: armor_bonus,
      shield_bonus: shield_bonus,
      size_modifier: size_modifier
    )
  end

  #Armory
  def armory
    return character.armory if character.armory.present?
    NullArmory.new
  end

  #Saves
  def reflex_save
    modifier_engine.total_bonus_for(:reflex_save) + stats.dexterity.modifier
  end

  def fortitude_save
    modifier_engine.total_bonus_for(:fortitude_save) + stats.constitution.modifier
  end

  def will_save
    modifier_engine.total_bonus_for(:will_save) + stats.wisdom.modifier
  end

  # Additional Details
  def weapon_proficiencies
    p = addition_engine.total_values_for :weapon_proficiency
    p << deity.favored_weapon if favored_class.is_a? Cleric
    p
  end

  def shield_proficiencies
    addition_engine.total_values_for :shield_proficiency
  end

  def armor_proficiencies
    addition_engine.total_values_for :armor_proficiency
  end

  def starting_language_options
    addition_engine.total_values_for :starting_languages
  end

  def high_intelligence_language_options
    addition_engine.total_values_for :high_intelligence_languages
  end

  #Feats
  def feat_count
    1 + modifier_engine.total_bonus_for(:feat_count)
  end

  #Deities
  def deity
    return Deity.new(character.deity_name) if character.deity_name.present?
    NullDeity.new
  end

  #Aligntments
  def allowed_alignments
    alignment_filter.remaining_options
  end

  private
  attr_reader :character

  def alignment_filter
    @_alignment_filter ||= AlignmentFilter.new(favored_class.alignment, deity)
  end

  def modifier_engine
    @_modifier_engine ||= ModIndexer.new mods
  end

  def addition_engine
    @_addition_engine ||= AdditionIndexer.new additions
  end

  def armor_bonus
    0
  end

  def shield_bonus
    0
  end

  def armor_check_penalty
    0
  end

  def class_skills
    favored_class.class_skills
  end

  def mods
    favored_class.mods + race.mods + feat_list.mods
  end

  def additions
    race.additions + favored_class.additions
  end

  def levels
    [character.level]
  end

  def feat_list
    return character.feat_list if character.feat_list.present?
    NullFeatList.new
  end

  def skill_list
    return character.skill_list if character.skill_list.present?
    NullSkillList.new
  end


  def stat_block
    return character.stat_block if character.stat_block.present?
    NullStatBlock.new
  end
end
