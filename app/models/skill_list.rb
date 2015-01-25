class SkillList < ActiveRecord::Base
  belongs_to :character

  def find(key)
    find_hash[key]
  end

  Skills::ALL.each do |sk|
    define_method "#{sk}" do
      options = Skills::DETAILS[sk]
      Skill.new(options, self)
    end
  end

  def all_skills
    @_all_skills ||= Skills::ALL.map do |sk|
      self.send(sk)
    end
  end

  def total_points
    all_skills.sum(&:point_value)
  end

  private

  #TODO
  # There is a better way to do this.
  def find_hash
    hash = {}
    Skills::ALL.map do |sk|
      keyed = { sk => self.send(sk) }
      hash.merge!(keyed)
    end
    hash
  end
end
