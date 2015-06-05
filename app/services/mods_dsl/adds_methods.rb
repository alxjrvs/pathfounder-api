module ModsDsl::AddsMethods
  def self.included klass
    klass.class_eval do
      include ModsDsl::SourceMethods
    end
  end

  def adds(hash)
    category = hash.keys.first
    values = hash.values.first
    add = ModsDsl::Addition.new(
      category: category,
      values: values,
      source: source
    )
    additions_array.push(add)
  end

  def languages(start, high: [])
    additions_array.push ModsDsl::Addition.new category: :starting_languages, values: start, source: source if start.present?
    additions_array.push ModsDsl::Addition.new category: :high_intelligence_languages, values: high, source: source if high.present?
  end

  def additions_array
    @_additions_array ||= []
  end
end
