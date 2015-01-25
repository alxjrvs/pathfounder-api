class SkillList < ActiveRecord::Base
  belongs_to :character

  def find(key)
  end

  Skills::ALL.each do |sk|
    define_method "#{sk}" do
      options = Skills::DETAILS[sk]
      Skill.new(options, self)
    end
  end

  def list
  end

  private

  #TODO
  # There is a better way to do this.
  def find_hash
    hash = 
    Skills::ALL.map do |sk|
      self.send(sk)
    end
  end
end
