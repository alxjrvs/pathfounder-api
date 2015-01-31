class SkillListSerializer < ActiveModel::Serializer
  Skills::ALL.each do |sk|
    attribute sk

    define_method(sk) do
      SkillSerializer.new(object.send(sk))
    end
  end

end
