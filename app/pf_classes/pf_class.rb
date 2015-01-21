class PfClass < ActiveRecord::Base
  include ModsDsl

  belongs_to :character
end
