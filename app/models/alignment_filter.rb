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
      if option.to_s.include?("not")
        not_option = option.to_s.split("_").last
        alignments.select! { |a| !a.to_s.include? not_option }
      else
        alignments.select! { |a| a.to_s.include? option.to_s }
      end
    end
    alignments
  end

  def alignment_options
    options = []
    options << alignment
    options.flatten
  end

  def allow_all?
    alignment.nil? || alignment == :any
  end

end
