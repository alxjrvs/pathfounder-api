module ModsDsl::FeatDsl
  def self.included(base)
    base.extend(FeatDslClassMethods)
  end

  def feats
    self.class.feat_array
  end
end
