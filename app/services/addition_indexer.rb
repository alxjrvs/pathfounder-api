class AdditionIndexer
  def initialize(additions)
    @additions = additions
  end

  def total_values_for(category)
    adds = find_by_category category
    array = []
    adds.each do |a|
      array += a.values
    end
    array
  end

  def find_by_category(category)
    indexed_adds_by_category[category.to_sym].to_a
  end

  private
  attr_reader :additions

  def indexed_adds_by_category
    @_indexed_adds_by_category ||= Indexer.index(additions, :category)
  end

end
