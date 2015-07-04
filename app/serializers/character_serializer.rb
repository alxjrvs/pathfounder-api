class CharacterSerializer < ActiveModel::Serializer
  has_one :race
  has_one :stat_block
  has_one :skill_list
  has_one :feat_list
  has_one :armory
  attributes :id, :name
end
