class Barbarian < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 12
  alignment :any_nonlawful

  class_skills :climb, :craft, :handle_animal
  skill_ranks_per_level 4

  base_attack_bonus      1
  mods fortitude_save:   2
  mods will_save:        0
  mods reflex_save:      0

  adds weapon_proficiency: [:simple, :martial]
  adds armor_proficiency: [:light, :medium]
  adds shield_proficiency: [:all] #except tower shields

  special :fast_movement
  special :rage
end
