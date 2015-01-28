FeatIndexer = Struct.new(:feats) do

  def find_by_name(name)
    return nil unless name.present?
    indexed_feats_by_name[name.to_sym]
  end

  private

  def indexed_feats_by_name
    @_indexed_feats_by_name ||= Indexer.index(feats, :name)
  end

end
