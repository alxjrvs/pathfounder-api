class Deity < ActiveRecord::Base
  has_many :characters

  ALIGNMENT_MATRIX = [
    [:lawful_good, :lawful_neutral, :lawful_evil],
    [:neutral_good, :true_neutral, :neutral_evil],
    [:chaotic_good, :chaotic_neutral, :chaotic_evil]
  ]

  def allowed_alignments
    first_index = ALIGNMENT_MATRIX.map { |a| a.include?(alignment.to_sym) }.find_index(true)
    second_index = ALIGNMENT_MATRIX[first_index].find_index(alignment.to_sym)
    neighboring_alignments(first_index, second_index)
  end

  def neighboring_alignments(a, b)
    alignments = []
    ALIGNMENT_MATRIX.each_with_index do |array, index|
      array.each_with_index do |al, i|
        if (index == a && (i-b).abs <=1) || ((index-a).abs <=1 && b==i)
          alignments << al
        end
      end
    end
    alignments
  end
end
