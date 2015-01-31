module ModsDsl::FeatMethods
  def feat(name)
    f = Feat.new(name)
    yield f
    feat_array.push f
  end

  def feat_array
    @_feat_array ||= []
  end
end
