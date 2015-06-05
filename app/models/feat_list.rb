class FeatList < ActiveRecord::Base
  include ModsDsl

  belongs_to :character
  validates :character, presence: true

  feat :acrobatics do |f|
    f.mods fly: +2
    f.mods acrobatics: +2
  end

  def chosen_feats
    @_chosen_feats ||= [
      find_by_name(feat_1),
      find_by_name(feat_2),
      find_by_name(feat_3)
    ].flatten.compact
  end

  def mods
    @_mods ||= chosen_feats.map { |feat| feat.all_mods }.flatten
  end

  def find_by_name(name)
    feat_indexer.find_by_name name
  end

  private

  def feat_indexer
    @_feat_indexer ||= FeatIndexer.new feats
  end

end
