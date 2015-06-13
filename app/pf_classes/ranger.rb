class Ranger < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 10
  alignment :any

  class_skills :craft, :climb, :handle_animal, :heal
  skill_ranks_per_level 6

  base_attack_bonus      1
  mods fortitude_save:   2
  mods will_save:        0
  mods reflex_save:      2

  adds weapon_proficiency: [:simple, :martial]
  adds armor_proficiency: [:light, :medium]
  adds shield_proficiency: [:all] # except tower shields

  special :favored_enemy
  special :track
  special :wild_empathy
end