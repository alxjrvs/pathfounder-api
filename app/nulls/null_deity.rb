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
    AlignmentFilter::ALIGNMENTS
  end
end
