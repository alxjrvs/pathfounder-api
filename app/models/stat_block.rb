class StatBlock < ActiveRecord::Base
  belongs_to :character
  validates :character, presence: true

  STATS =
    :constitution,
    :charisma,
    :intelligence,
    :wisdom,
    :strength,
    :dexterity

  STATS.each do |stat|
    define_method "#{stat}" do
      Stat.new(stat, calculated_value(stat))
    end
  end

  def all_stats
    STATS.map do |stat|
      self.send(stat)
    end
  end

  private

  def calculated_value(stat)
    StatCalculator.value(self, stat)
  end
end
