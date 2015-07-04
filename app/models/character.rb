class Character < ActiveRecord::Base
  has_one :level, dependent: :destroy
  has_one :stat_block, dependent: :destroy
  has_one :skill_list, dependent: :destroy
  has_one :feat_list, dependent: :destroy
  has_one :armory, dependent: :destroy

  belongs_to :race, polymorphic: true
end
