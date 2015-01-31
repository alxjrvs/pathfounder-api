class StatBlockSerializer < ActiveModel::Serializer
  StatBlock::STATS.each do |st|
    attribute st

    define_method(st) do
      StatSerializer.new(object.send(st))
    end
  end
end
