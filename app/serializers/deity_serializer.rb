class DeitySerializer < ActiveModel::Serializer
  attributes :id, :name, :domains, :subdomains, :favored_weapon
end
