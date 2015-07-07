class Character < ActiveRecord::Base
  has_one :level, dependent: :destroy
  has_one :stat_block, dependent: :destroy
  has_one :skill_list, dependent: :destroy
  has_one :feat_list, dependent: :destroy
  has_one :armory, dependent: :destroy

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

  alias_method :feat_list_attr, :feat_list
  def feat_list
    feat_list_attr || NullFeatList.new
  end

  alias_method :armory_attr, :armory
  def armory
    armory_attr || NullArmory.new
  end

  def skills
    skill_list.all_skills
  end

  def stats
    stat_block.all_stats
  end

  def feats
    feat_list.chosen_feats
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

  def initiative_bonus
    dexterity.modifier
  end

  def feat_count
    1 + total_modifier_for(:feat_count)
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

  def armor_bonus
    0
  end

  def shield_bonus
    0
  end

  def armor_class
    combat.armor_class
  end

  def flat_footed
    combat.flat_footed
  end

  def ranged_attack_bonus
    combat.ranged_attack_bonus
  end

  def melee_attack_bonus
    combat.melee_attack_bonus
  end

  def weapon_proficiencies
    proficiencies = total_additions_for :weapon_proficiency
    proficiencies << deity.favored_weapon if level.try(:pf_class_type) == "Cleric"
    proficiencies
  end

  def shield_proficiencies
    total_additions_for :shield_proficiency
  end

  def armor_proficiencies
    total_additions_for :armor_proficiency
  end

  def starting_language_options
    total_additions_for :starting_languages
  end

  def high_intelligence_language_options
    total_additions_for :high_intelligence_languages
  end

  def total_additions_for(category)
    addition_indexer.total_values_for category
  end

  def total_modifier_for(trait)
    mod_indexer.total_bonus_for trait
  end

  def find_mods_by_trait(trait)
    mod_indexer.find_by_trait trait
  end

  def deity
    deity_name ? Deity.new(deity_name) : NullDeity.new
  end

  private

  def class_skill_ranks_per_level
    favored_class.skill_ranks_per_level
  end

  def class_mods
    favored_class.mods
  end

  def feat_mods
    feat_list.mods
  end

  def race_mods
    race.mods
  end

  def mods
    class_mods + race_mods + feat_mods
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

  def combat
    @_combat ||= CharacterCombatMathCalculator.new self
  end

  def addition_indexer
    @_addition_indexer ||= AdditionIndexer.new additions
  end

  def mod_indexer
    @_mod_indexer ||= ModIndexer.new mods
  end

  def alignment_filter
    @_alignment_filter ||= AlignmentFilter.new(favored_class.alignment, deity)
  end
end
