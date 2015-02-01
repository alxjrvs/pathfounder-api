class Api::V1::StatBlocksController < Api::V1::CharacterRequiredController
  def create
    render json: stat_block if stat_block.save!
  end

  def update
    render json: character if stat_block.update_attributes(stat_block_params)
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

  def stat_block_params
    params.require(:stat_block).permit(
      :wisdom_val,
      :charisma_val,
      :constitution_val,
      :intelligence_val,
      :strength_val,
      :dexterity_val,
      )
  end
end
