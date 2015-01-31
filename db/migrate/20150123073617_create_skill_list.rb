class CreateSkillList < ActiveRecord::Migration
  def change
    create_table :skill_lists do |t|
      t.belongs_to :character
      t.integer :acrobatics_val, default: 0
      t.integer :appraise_val, default: 0
      t.integer :bluff_val, default: 0
      t.integer :climb_val, default: 0
      t.integer :craft_1_val, default: 0
      t.string  :craft_1_name, default: ""
      t.integer :craft_2_val, default: 0
      t.string  :craft_2_name, default: ""
      t.integer :craft_3_val, default: 0
      t.string  :craft_3_name, default: ""
      t.integer :diplomancy_val, default: 0
      t.integer :disable_device_val, default: 0
      t.integer :disguise_val, default: 0
      t.integer :escape_artist_val, default: 0
      t.integer :fly_val, default: 0
      t.integer :handle_animal_val, default: 0
      t.integer :heal_val, default: 0
      t.integer :intimidate_val, default: 0
      t.integer :knowledge_arcana_val, default: 0
      t.integer :knowledge_dungeoneering_val, default: 0
      t.integer :knowledge_engineering_val, default: 0
      t.integer :knowledge_geography_val, default: 0
      t.integer :knowledge_history_val, default: 0
      t.integer :knowledge_local_val, default: 0
      t.integer :knowledge_nature_val, default: 0
      t.integer :knowledge_nobility_val, default: 0
      t.integer :knowledge_planes_val, default: 0
      t.integer :knowledge_religion_val, default: 0
      t.integer :linguistics_val, default: 0
      t.integer :perception_val, default: 0
      t.integer :perform_1_val, default: 0
      t.string  :perform_1_name, default: ""
      t.integer :perform_2_val, default: 0
      t.string  :perform_2_name, default: ""
      t.integer :perform_3_val, default: 0
      t.string  :perform_3_name, default: ""
      t.integer :profession_val, default: 0
      t.string  :profession_name_val, default: ""
      t.integer :ride_val, default: 0
      t.integer :sense_motive_val, default: 0
      t.integer :sleight_of_hand_val, default: 0
      t.integer :spellcraft_val, default: 0
      t.integer :stealth_val, default: 0
      t.integer :survival_val, default: 0
      t.integer :swim_val, default: 0
      t.integer :use_magic_device_val, default: 0
    end
  end
end
