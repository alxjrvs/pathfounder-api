class Monk < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 8
  alignment :lawful

  class_skills :climb, :craft, :acrobatics
  skill_ranks_per_level 4

  base_attack_bonus      0
  mods feat_count:       1
  mods fortitude_save:   2
  mods will_save:        2
  mods reflex_save:      2

  adds weapon_proficiency: [
    :club,
    :light_crossbow,
    :heavy_crossbow,
    :dagger,
    :handaxe,
    :javelin,
    :kama,
    :nunchaku,
    :quarterstaff,
    :sai,
    :shortspear,
    :short_sword,
    :shuriken,
    :siangham,
    :sling,
    :spear
  ]

  special :flurry_of_blows
  special :stunning_fist
  special :unarmed_strike

end
