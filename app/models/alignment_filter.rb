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
    alignments = ALIGNMENTS.dup
    alignment_options.each do |option|
      reg = /not_(?<not_option>\w+)/.match(option.to_s)
      if reg
        alignments.select! { |a| !a.to_s.include? reg[:not_option] }
      else
        alignments.select! { |a| a.to_s.include? option.to_s }
      end
    end
    alignments
  end

  def alignment_options
    [alignment].flatten
  end

  def allow_all?
    alignment.nil? || alignment == :any
  end

end
