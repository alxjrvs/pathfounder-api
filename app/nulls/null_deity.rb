class NullDeity
  include Null

  def name
    ""
  end

  def alignment
    ""
  end

  def domains
    []
  end

  def subdomains
    []
  end

  def favored_weapon
    ""
  end

  def allowed_alignments
    [:lawful_good, :lawful_neutral, :lawful_evil,
     :neutral_good, :true_neutral, :neutral_evil,
     :chaotic_good, :chaotic_neutral, :chaotic_evil]
  end
end
