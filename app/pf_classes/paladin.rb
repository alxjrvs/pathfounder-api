class Paladin < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 10
  alignment :lawful_good

  class_skills :craft, :diplomacy, :handle_animal, :heal
  skill_ranks_per_level 2

  base_attack_bonus      1
  mods fortitude_save:   2
  mods will_save:        2
  mods reflex_save:      0

  adds weapon_proficiency: [:simple, :martial]
  adds armor_proficiency: [:light, :medium, :heavy]
  adds shield_proficiency: [:all] # except tower shields

  special :aura_of_good
  special :detect_evil
  special :smite_evil # 1/day

end