class StatCalculator
  STATS =
    :constitution,
    :charisma,
    :intelligence,
    :wisdom,
    :strength,
    :dexterity

  def initialize(stat_block:, mods:)
    @stat_block = stat_block
    @mods = mods
  end

  STATS.each do |stat|
    define_method "#{stat}" do
      Stat.new(stat, calculated_value_for(stat))
    end
  end

  private

  STATS.each do |stat|
    define_method "#{stat}_persisted" do
      stat_block.send("#{stat}_val").to_i
    end

    define_method "#{stat}_mods" do
      mods.total_bonus_for(stat).to_i
    end
  end

  attr_reader :mods, :stat_block

  def calculated_value_for(stat)
    send("#{stat}_mods") + send("#{stat}_persisted")
  end
end
