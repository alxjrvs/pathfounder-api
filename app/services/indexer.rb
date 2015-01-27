class Indexer
  def self.index(array, method)
    index = {}
    array.each do |ar|
      index[ar.send(method)] ||= []
      index[ar.send(method)] += [ar]
    end
    index
  end
end
