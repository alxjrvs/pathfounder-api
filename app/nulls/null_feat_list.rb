class NullFeatList
  include Null

  def mods
    []
  end

  def chosen_feats
    []
  end

  def find_by_name(name)
    nil
  end

  def feat_1
    nil
  end

  def feat_2
    nil
  end

  def feat_3
    nil
  end

  def character
    NullCharacter.new
  end

end
