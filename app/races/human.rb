class Human < ActiveRecord::Base
  include ModsDsl
  has_one :character, as: :race

  role :race
  mods feat_count: 1

  def mods
    @_mods ||= begin
       self.class.mods_array + [human_ability_score_mod]
    end
  end

  private

  def human_ability_score_mod
    @_human_ability_score_mod ||= begin
      options = { trait: human_ability_bonus,
        modifier: +2}
      Mod.new options, self.class.source
    end
  end

  def human_ability_bonus
    :strength
  end

end
