module ModsDsl::FeatDslClassMethods

  attr_accessor :feat_array

  def feat(name)
    feat_array ||= []
    f = Feat.new(name: name)
    yield f
    feat_array.push f
  end

end
