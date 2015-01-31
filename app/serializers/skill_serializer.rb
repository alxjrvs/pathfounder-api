class SkillSerializer < ActiveModel::Serializer
  self.root = false
  attributes :untrained, :key_stat, :custom, :name, :value, :point_value

  def custom
    object.custom ? true : false
  end

  def name
    if object.custom
      object.name
    else
      ""
    end
  end
end
