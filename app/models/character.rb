class Character < ActiveRecord::Base
  has_one :level, dependent: :destroy
  has_one :stat_block, dependent: :destroy
  has_one :skill_list, dependent: :destroy

  belongs_to :race, polymorphic: true

  CLASS_DELEGATES = :hit_die, :base_attack_bonus
  CLASS_DELEGATES.each do |cd|
    delegate cd, to: :favored_class
  end
  delegate :all_skills, to: :skills

  Skills::ALL.each do |sk|
    delegate sk, to: :skills
  end

  StatBlock::STATS.each do |s|
    delegate "#{s}", to: :stats
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

  def char_race
    if race.present?
      race
    else
      NullRace.new
    end
  end

  def skills
    skill_list || NullSkillList.new
  end

  def stats
    stat_block || NullStatBlock.new
  end

  def all_skills
    skills.all_skills
  end

  def all_stats
    stats.all_stats
  end

  def class_skills
    favored_class.skills
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

  def total_modifier_for(trait)
    mod_indexer.total_bonus_for trait
  end

  def mods
    class_mods + race_mods
  end

  private

  def class_skill_ranks_per_level
    favored_class.skill_ranks_per_level
  end

  def class_mods
    favored_class.mods
  end

  def race_mods
    char_race.mods
  end

  def mod_indexer
    @_mod_indexer ||= ModIndexer.new mods
  end

  def alignment_filter
    @_alignment_filter ||= AlignmentFilter.new(favored_class.alignment)
  end
end
