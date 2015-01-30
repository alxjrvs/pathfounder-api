class Api::V1::CharactersController < ApplicationController

  def create
    render json: character if character.save!
  end

  def show
    render json: character
  end

  private
  def character
    @_character ||= begin
      if params[:id]
        Character.find params[:id]
      else
        Character.new character_params
      end
    end
  end

  def character_params
    params.require(:character).permit(:name)
  end
end
