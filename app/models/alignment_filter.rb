class AlignmentFilter
  attr_reader :alignment

  ALIGNMENT_MATRIX = [
    [:lawful_good, :lawful_neutral, :lawful_evil],
    [:neutral_good, :true_neutral, :neutral_evil],
    [:chaotic_good, :chaotic_neutral, :chaotic_evil]
  ]
  ALIGNMENTS = ALIGNMENT_MATRIX.flatten

  def initialize(alignment, deity = nil)
    @alignment = alignment
    @deity = deity
  end

  def remaining_options
    if allow_all?
      ALIGNMENTS
    elsif matches_deity?
      deity_alignments
    else
      filtered_alignments
    end
  end

  private

  def filtered_alignments
    alignments = ALIGNMENTS.dup
    reg = /not_(?<not_option>\w+)/.match(alignment.to_s)
    if reg
      alignments.select! { |a| !a.to_s.include? reg[:not_option] }
    else
      alignments.select! { |a| a.to_s.include? alignment.to_s }
    end
    alignments
  end

  def allow_all?
    alignment.nil? || alignment == :any
  end

  def matches_deity?
    alignment == :matches_deity
  end

  def deity_alignments
    @deity.allowed_alignments
  end

end
