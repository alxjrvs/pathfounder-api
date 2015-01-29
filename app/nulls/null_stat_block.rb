class NullStatBlock
  include Null

  def all_stats
    []
  end

  StatBlock::STATS.each do |s|
    define_method s do
      NullStat.new
    end
  end
end
