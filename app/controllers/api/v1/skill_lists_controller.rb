class Api::V1::SkillListsController < ApplicationController

  def create
    render nothing: true, status: 422 unless character.present?
    render json: skill_list if skill_list.save!
  end

  def update
    render nothing: true, status: 422 unless character.present?
    render json: character if skill_list.update_attributes(skill_list_params)
  end

  private

  def skill_list
    @_skill_list ||= begin
      if character.skill_list.present?
      else
        SkillList.new(skill_list_params.merge(character: character))
      end
    end
  end

  def character
    @_character ||= Character.find(params[:character_id])
  end

  def skill_list_params
    params.require(:skill_list).permit(
      :acrobatics_val,
      :appraise_val,
      :bluff_val,
      :craft_1_val,
      :craft_1_name,
      :craft_2_val,
      :craft_2_name,
      :craft_3_val,
      :craft_3_name,
      :diplomancy_val,
      :disable_device_val,
      :disguise_val,
      :escape_artist_val,
      :fly_val,
      :heal_val,
      :knowledge_arcana_val,
      :knowledge_dungeoneering_val,
      :knowledge_engineering_val,
      :knowledge_geography_val,
      :knowledge_history_val,
      :knowledge_local_val,
      :knowledge_nature_val,
      :knowledge_nobility_val,
      :knowledge_planes_val,
      :knowledge_religion_val,
      :linguistics_val,
      :perception_val,
      :perform_1_val,
      :perform_1_name,
      :perform_2_val,
      :perform_2_name,
      :perform_3_val,
      :perform_3_name,
      :profession_val,
      :profession_name_val,
      :ride_val,
      :sense_motive_val,
      :sleight_of_hand_val,
      :spellcraft_val,
      :stealth_val,
      :survival_val,
      :swim_val,
      :use_magic_device_val,
    )
  end
end
