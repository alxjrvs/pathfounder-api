module ModsDsl::AddsMethods
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

  def languages(start, high: high)
    additions_array.push ModsDsl::Addition.new category: :starting_languages, values: start if start.present?
    additions_array.push ModsDsl::Addition.new category: :high_intelligence_languages, values: high if high.present?
  end

  def additions_array
    @_additions_array ||= []
  end
end