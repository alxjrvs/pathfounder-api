module ModsDsl
  class Addition
    attr_reader :category, :values, :source
    def initialize(category: category, values: values, source: source)
      @category = category
      @values = values
      @source = source
    end
  end
end
