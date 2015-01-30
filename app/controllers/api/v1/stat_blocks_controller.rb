class Api::V1::StatBlocksController < ApplicationController
  def create
    render nothing: true, status: 422 unless character.present?
    render json: stat_block if stat_block.save!
  end

  private

  def stat_block
    @_stat_block ||= begin
     if character.stat_block.present?
       character.stat_block
     else
       StatBlock.new(stat_block_params.merge(character: character))
     end
   end
  end

  def character
    @_character ||= Character.find(params[:character_id])
  end

  def stat_block_params
    params.require(:stat_block).permit(:wisdom_val, :charisma_val, :constitution_val, :intelligence_val, :strength_val, :dexterity_val, :character)
  end
end
