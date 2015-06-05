class Level < ActiveRecord::Base
  belongs_to :character
  belongs_to :pf_class, polymorphic: true
  validates :character, presence: true

end
