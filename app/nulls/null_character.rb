class NullCharacter

  Character::CLASS_DELEGATES.each do |cd|
    delegate cd, to: :favored_class
  end
  StatBlock::STATS.each do |s|
    delegate "#{s}", to: :stats
  end
  Skills::ALL.each do |sk|
    delegate sk, to: :skill_list
  end

  def nil?
    true
  end

  def calculated_skill_ranks
    0
  end

  def allowed_alignments
    []
  end

  def armor_check_penalty
    0
  end

  def mods
    []
  end

  def total_modifer_for(trait)
    0
  end

  def find_mods_by_trait(trait)
    []
  end

  def skill_list
    NullSkillList.new
  end

  def skills
    skill_list.skills
  end

  def stat_block
    NullStatBlock.new
  end

  def stats
    stat_block
  end

  def favored_class
    NullPfClass.new
  end

  def feat_count
    0
  end

  def class_skills
    []
  end
end
