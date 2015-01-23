class Character < ActiveRecord::Base
  has_many :mods
  has_many :levels

  def favored_class
    first_level.pf_class
  end

  private

  def first_level
    levels.first
  end
end
