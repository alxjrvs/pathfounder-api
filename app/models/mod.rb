class Mod < ActiveRecord::Base
  belongs_to :source, polymorphic: true
  belongs_to :character

end
