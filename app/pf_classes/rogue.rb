class Rogue < ActiveRecord::Base
  include ModsDsl
  has_one :level, as: :pf_class, dependent: :destroy
  has_one :character, through: :level

  role :class
  hit_die 8
  alignment :any

  class_skills :climb, :craft, :handle_animal :disable_device
  skill_ranks_per_level 8

  base_attack_bonus      0
  mods fortitude_save:   0
  mods will_save:        0
  mods reflex_save:     +2

  adds weapon_proficiency: [:simple,
    :hand_crossbow,
    :rapier,
    :sap,
    :shortbow,
    :short_sword
    ]
  adds armor_proficiency: [:light]
  adds shield_proficiency: [:none]

  special :trapfinding
  special :sneak_attack
  end
