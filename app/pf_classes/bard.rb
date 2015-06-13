class Bard < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 8
  alignment :any

  class_skills :bluff, :appraise, :acrobatics
  skill_ranks_per_level 6

  base_attack_bonus      0
  mods feat_count:       0
  mods fortitude_save:   0
  mods will_save:        2
  mods reflex_save:      2

  adds weapon_proficiency: [
    :simple
    :longsword
    :rapier
    :sap
    :short_sword
    :shortbow
  ]

  adds armor_proficiency: [:light]
  adds shield_proficiency: [:all] #except tower shields

  special :barding_knowledge
  special :bardic_performance
  special :cantrips
  special :countersong
  special :distraction
  special :fascinate
  special :inspire_courage

end
