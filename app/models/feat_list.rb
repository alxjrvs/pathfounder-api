class FeatList < ActiveRecord::Base
  include ModsDsl
  belongs_to :character
  validates :character, presence: true
end
