class Api::V1::CharactersController < ApplicationController

  def create
    character = Character.new character_params
    if character.save!
      render nothing: true, status: 200
    else
      render nothing: true, status: 422
    end
  end

  def show
    render text: "dummy"
  end

  private

  def character_params
    params.require(:character).permit(:name)
  end
end
