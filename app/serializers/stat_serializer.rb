class StatSerializer < ActiveModel::Serializer
  self.root = false
  attributes :value, :modifier
end
