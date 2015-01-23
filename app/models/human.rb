class Human < ActiveRecord::Base
  include ModsDsl
  has_one :character, as: :race

  role :race
end
