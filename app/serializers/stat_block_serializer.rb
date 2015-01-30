class StatBlockSerializer < ActiveModel::Serializer
  StatBlock::STATS.each do |st|
    attribute st
  end
end
