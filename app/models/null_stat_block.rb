class NullStatBlock

  def nil?
    true
  end

  StatBlock::STATS.each do |s|
    define_method s do
      NullStat.new
    end
  end
end
