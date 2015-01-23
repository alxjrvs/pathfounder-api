class Character < ActiveRecord::Base
  has_many :mods
  has_many :levels

  CLASS_DELEGATES = :hit_die, :alignment

  CLASS_DELEGATES.each do |cd|
    delegate cd, to: :favored_class
  end

  def allowed_alignments
    alignment_filter.remaining_options
  end

  def favored_class
    if first_level.present?
      first_level.pf_class
    else
      NullFavoredClass.new
    end
  end

  def first_level
    levels.first
  end

  def class_skill_ranks_per_level
    favored_class.skill_ranks_per_level
  end

  def class_skills
    favored_class.skills
  end

  def alignment_filter
    @_alignment_filter ||= AlignmentFilter.new(alignment)
  end
end
