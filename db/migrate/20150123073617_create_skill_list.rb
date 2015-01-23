class CreateSkillList < ActiveRecord::Migration
  def change
    create_table :skill_lists do |t|
      t.belongs_to :character
      t.integer :acrobatics
      t.integer :appraise
      t.integer :bluff
      t.integer :climb
      t.integer :craft_1
      t.string  :craft_1_name
      t.integer :craft_2
      t.string  :craft_2_name
      t.integer :craft_3
      t.string  :craft_3_name
      t.integer :diplomancy
      t.integer :disable_device
      t.integer :disguise
      t.integer :escape_artist
      t.integer :fly
      t.integer :handle_animal
      t.integer :heal
      t.integer :intimidate
      t.integer :knowledge_arcana
      t.integer :knowledge_dungeoneering
      t.integer :knowledge_engineering
      t.integer :knowledge_geography
      t.integer :knowledge_history
      t.integer :knowledge_local
      t.integer :knowledge_nature
      t.integer :knowledge_nobility
      t.integer :knowledge_planes
      t.integer :knowledge_religion
      t.integer :linguistics
      t.integer :perception
      t.integer :perform_1
      t.string  :perform_1_name
      t.integer :perform_2
      t.string  :perform_2_name
      t.integer :perform_3
      t.string  :perform_3_name
      t.integer :profession
      t.string  :profession_name
      t.integer :ride
      t.integer :sense_motive
      t.integer :sleight_of_hand
      t.integer :spellcraft
      t.integer :stealth
      t.integer :survival
      t.integer :swim
      t.integer :use_magic_device
    end
  end
end
