class Character < ActiveRecord::Base
  has_many :mods, dependent: :destroy
  has_one :level, dependent: :destroy
  belongs_to :race, polymorphic: true

  CLASS_DELEGATES = :hit_die, :base_attack_bonus

  CLASS_DELEGATES.each do |cd|
    delegate cd, to: :favored_class
  end

  def allowed_alignments
    alignment_filter.remaining_options
  end

  def favored_class
    if level.present?
      level.pf_class
    else
      NullFavoredClass.new
    end
  end

  def class_skill_ranks_per_level
    favored_class.skill_ranks_per_level
  end

  def class_skills
    favored_class.skills
  end

  def feat_count
    total_mod_for(:feat_count)
  end

  private

  def mods_for(trait)
    mods.where(trait: trait)
  end

  def total_mod_for(trait)
    mods_for(trait)
  end

  def alignment_filter
    @_alignment_filter ||= AlignmentFilter.new(favored_class.alignment)
  end
end
