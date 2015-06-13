class Wizard < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 6
  alignment :any

  class_skills :craft, :appraise, :fly
  skill_ranks_per_level 2

  base_attack_bonus      0
  mods fortitude_save:   0
  mods will_save:        2
  mods reflex_save:      0

  adds weapon_proficiency: [
    :club,
    :dagger,
    :heavy_crossbow,
    :light_crossbow,
    :quarterstaff
  ]

  special :arcane_bond
  special :arcane_school
  special :scribe_scroll
  special :cantrips
end