class SkillList < ActiveRecord::Base
  belongs_to :character

  Skills::ALL.each do |sk|
    define_method "#{sk}" do
      options = Skills::DETAILS[sk]
      Skill.new(options, self)
    end
  end

end
