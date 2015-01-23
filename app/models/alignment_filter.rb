class AlignmentFilter
  attr_reader :alignment

  ALIGNMENTS =
    :true_neutral,
    :neutral_good,
    :neutral_evil,
    :lawful_neutral,
    :lawful_good,
    :lawful_evil,
    :chaotic_neutral,
    :chaotic_good,
    :chaotic_evil

  def initialize(alignment)
    @alignment = alignment
  end

  def remaining_options
    if allow_all?
      ALIGNMENTS
    else
      filtered_alignments
    end
  end

  private

  def filtered_alignments
    ALIGNMENTS.select do |a|
      a if a.to_s.include? alignment.to_s
    end
  end

  def allow_all?
    alignment.nil? || alignment == :any
  end

end
