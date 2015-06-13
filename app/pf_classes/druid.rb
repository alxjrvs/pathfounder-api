class Druid < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 8
  alignment :any_neutral

  class_skills :craft, :climb, :fly, :handle_animals
  skill_ranks_per_level 4

  base_attack_bonus      0
  mods fortitude_save:   2
  mods will_save:        2
  mods reflex_save:      0

  adds weapon_proficiency: [
    :club,
    :dagger,
    :dart,
    :quarterstaff,
    :scimitar,
    :scythe,
    :sickle,
    :shortspear,
    :sling,
    :spear
  ]
  adds armor_proficiency: [:light, :medium] # no metal armor
  adds shield_proficiency: [:all] # except tower shields, no metal shields, only wood

  special :nature_bond
  special :nature_sense
  special :wild_empathy
  special :orisons
end