class CreateSkillList < ActiveRecord::Migration
  def change
    create_table :skill_lists do |t|
      t.belongs_to :character
      t.integer :acrobatics_val
      t.integer :appraise_val
      t.integer :bluff_val
      t.integer :climb_val
      t.integer :craft_1_val
      t.string  :craft_1_name
      t.integer :craft_2_val
      t.string  :craft_2_name
      t.integer :craft_3_val
      t.string  :craft_3_name
      t.integer :diplomancy_val
      t.integer :disable_device_val
      t.integer :disguise_val
      t.integer :escape_artist_val
      t.integer :fly_val
      t.integer :handle_animal_val
      t.integer :heal_val
      t.integer :intimidate_val
      t.integer :knowledge_arcana_val
      t.integer :knowledge_dungeoneering_val
      t.integer :knowledge_engineering_val
      t.integer :knowledge_geography_val
      t.integer :knowledge_history_val
      t.integer :knowledge_local_val
      t.integer :knowledge_nature_val
      t.integer :knowledge_nobility_val
      t.integer :knowledge_planes_val
      t.integer :knowledge_religion_val
      t.integer :linguistics_val
      t.integer :perception_val
      t.integer :perform_1_val
      t.string  :perform_1_name
      t.integer :perform_2_val
      t.string  :perform_2_name
      t.integer :perform_3_val
      t.string  :perform_3_name
      t.integer :profession_val
      t.string  :profession_name_val
      t.integer :ride_val
      t.integer :sense_motive_val
      t.integer :sleight_of_hand_val
      t.integer :spellcraft_val
      t.integer :stealth_val
      t.integer :survival_val
      t.integer :swim_val
      t.integer :use_magic_device_val
    end
  end
end
