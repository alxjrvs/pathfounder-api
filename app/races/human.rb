class Human < ActiveRecord::Base
  include ModsDsl
  has_one :character, as: :race

  role :race
  mods feat_count: 1
  speed :normal
  size :medium


  alias_method :character_attr, :character
  def character
    character_attr || NullCharacter.new
  end

  alias_method :mods_attr, :mods
  def mods
    @_mods ||= begin
       self.mods_attr + [ability_bonus_mod]
    end
  end

  private

  def ability_bonus_mod
    @_human_ability_score_mod ||= begin
      options = { trait: ability_bonus,
        modifier: +2}
      Mod.new options, self.class.source
    end
  end

end
