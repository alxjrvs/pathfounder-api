class Character < ActiveRecord::Base
  has_one :level, dependent: :destroy
  has_one :stat_block, dependent: :destroy
  has_one :skill_list, dependent: :destroy

  belongs_to :race, polymorphic: true

  CLASS_DELEGATES = :hit_die, :base_attack_bonus
  CLASS_DELEGATES.each do |cd|
    delegate cd, to: :favored_class
  end

  RACE_DELEGATES = :size_modifier, :size, :speed
  RACE_DELEGATES.each do |rd|
    delegate rd, to: :race
  end

  Skills::ALL.each do |sk|
    delegate sk, to: :skill_list
  end

  StatBlock::STATS.each do |s|
    delegate "#{s}", to: :stat_block
  end

  def allowed_alignments
    alignment_filter.remaining_options
  end

  def favored_class
    if level.present?
      level.pf_class
    else
      NullPfClass.new
    end
  end

  alias_method :race_attr, :race
  def race
    race_attr || NullRace.new
  end

  alias_method :skill_list_attr, :skill_list
  def skill_list
    skill_list_attr || NullSkillList.new
  end

  alias_method :stat_block_attr, :stat_block
  def stat_block
    stat_block_attr || NullStatBlock.new
  end

  def skills
    skill_list.all_skills
  end

  def stats
    stat_block.all_stats
  end

  def class_skills
    favored_class.class_skills
  end

  def calculated_skill_ranks
    class_skill_ranks_per_level.to_i +
      intelligence.modifier
  end

  def armor_check_penalty
    0
  end

  def feat_count
    1 + total_modifier_for(:feat_count)
  end

  def find_mods_by_trait(trait)
    mod_indexer.find_by_trait trait
  end

  def reflex_save_bonus
    total_modifier_for(:reflex_save) + dexterity.modifier
  end

  def fortitude_save_bonus
    total_modifier_for(:fortitude_save) + constitution.modifier
  end

  def will_save_bonus
    total_modifier_for(:will_save) + wisdom.modifier
  end

  def total_modifier_for(trait)
    mod_indexer.total_bonus_for trait
  end

  def armor_bonus
    0
  end

  def shield_bonus
    0
  end

  def armor_class
    CharacterCombatMathCalculator.armor_class(
      mods_bonus: total_modifier_for(:armor_class),
      dex_mod: dexterity.modifier,
      armor_bonus: armor_bonus,
      shield_bonus: shield_bonus
    )
  end

  def ranged_attack_bonus
    CharacterCombatMathCalculator.ranged_attack_bonus(
    base_attack_bonus: base_attack_bonus,
    size_modifier: size_modifier,
    dex_mod: dexterity.modifier
    )
  end

  def melee_attack_bonus
    CharacterCombatMathCalculator.melee_attack_bonus(
      base_attack_bonus: base_attack_bonus,
      size_modifier: size_modifier,
      str_mod: strength.modifier
    )
  end

  private

  def class_skill_ranks_per_level
    favored_class.skill_ranks_per_level
  end

  def class_mods
    favored_class.mods
  end

  def race_mods
    race.mods
  end

  def mods
    class_mods + race_mods
  end

  def race_adds
    race.additions
  end

  def class_adds
    favored_class.additions
  end

  def additions
    race_adds + class_adds
  end

  def addition_indexer
    @_addition_indexer ||= AdditionIndexer.new addition
  end

  def mod_indexer
    @_mod_indexer ||= ModIndexer.new mods
  end

  def alignment_filter
    @_alignment_filter ||= AlignmentFilter.new(favored_class.alignment)
  end
end
