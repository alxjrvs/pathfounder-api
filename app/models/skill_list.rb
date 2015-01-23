class SkillList < ActiveRecord::Base
  belongs_to :character

  SKILLS = :acrobatics,
    :appraise,
    :bluff,
    :climb,
    :craft_1,
    :craft_2,
    :craft_3,
    :diplomancy,
    :disable_device,
    :disguise,
    :escape_artist,
    :fly,
    :handle_animal,
    :heal,
    :intimidate,
    :knowledge_arcana,
    :knowledge_dungeoneering,
    :knowledge_engineering,
    :knowledge_geography,
    :knowledge_history,
    :knowledge_local,
    :knowledge_nature,
    :knowledge_nobility,
    :knowledge_planes,
    :knowledge_religion,
    :linguistics,
    :perception,
    :perform_1,
    :perform_2,
    :perform_3,
    :profession,
    :profession_name,
    :ride,
    :sense_motive,
    :sleight_of_hand,
    :spellcraft,
    :stealth,
    :survival,
    :swim,
    :use_magic_device

  SKILLS.each do |sk|
    define_method "#{sk}_details" do
      SkillDetailer.new(sk).get_details
    end
  end

end
