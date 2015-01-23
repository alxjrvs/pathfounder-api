class NullStatBlock

  def nil?
    true
  end

  StatBlock::STATS.each do |s|
    define_method s do
      nil
    end

    define_method "#{s}_mod" do
      nil
    end
  end
end
