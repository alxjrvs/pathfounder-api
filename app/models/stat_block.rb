class StatBlock < ActiveRecord::Base
  belongs_to :character

  STATS =
    :constitution,
    :charisma,
    :intelligence,
    :wisdom,
    :strength,
    :dexterity

  STATS.each do |stat|
    define_method "#{stat}_mod" do
      (self.send(stat) / 10) / 2
    end
  end

end
