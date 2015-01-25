class Human < ActiveRecord::Base
  include ModsDsl
  has_one :character, as: :race

  role :race
  mods feat_count: 1

  def mods
    @_mods ||= begin
       self.class.mods_array + [ability_bonus_mod]
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
