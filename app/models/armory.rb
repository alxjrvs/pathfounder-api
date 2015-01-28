class Armory < ActiveRecord::Base
  belongs_to :character

  alias_method :character_attr, :character
  def character
    character_attr || NullCharacter.new
  end
end
