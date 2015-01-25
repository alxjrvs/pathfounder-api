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
    define_method "#{stat}" do
      Stat.new(stat, self.send("#{stat}_val"))
    end
  end

  def all_stats
    STATS.map do |stat|
      self.send(stat)
    end
  end

end
