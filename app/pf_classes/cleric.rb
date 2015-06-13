class Cleric < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 8
  # alignment :A cleric's alignment must be within one step of her deity's,
  # along either the law/chaos axis or the good/evil axis

  class_skills :craft, :appraise, :diplomacy, :heal
  skill_ranks_per_level 2

  base_attack_bonus      0
  mods fortitude_save:   2
  mods will_save:        2
  mods reflex_save:      0

  # Clerics are also proficient with the favored weapon of their deity.
  adds weapon_proficiency: [:simple]
  adds armor_proficiency: [:light, :medium]
  adds shield_proficiency: [:all] # except tower shields

  special :aura
  special :channel_energy
  special :domains
  special :orisons
end
