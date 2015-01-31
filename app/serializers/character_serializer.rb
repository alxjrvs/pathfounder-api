class CharacterSerializer < ActiveModel::Serializer
  has_one :race
  has_one :stat_block
  has_one :skill_list
  has_one :feat_list
  has_one :armory
  attributes :id, :name,
    :favored_class, :race, :stat_block, :skill_list,
    :feat_list, :armory,
    :allowed_alignments, :calculated_skill_ranks,
    :armor_check_penalty, :initiative_bonus,
    :feat_count, :reflex_save_bonus,
    :fortitude_save_bonus, :will_save_bonus,
    :armor_bonus, :shield_bonus, :armor_class,
    :flat_footed, :ranged_attack_bonus,
    :melee_attack_bonus, :weapon_proficiencies,
    :shield_proficiencies, :armor_proficiencies,
    :starting_language_options,
    :high_intelligence_language_options

end
