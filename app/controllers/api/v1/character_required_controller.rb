class Api::V1::CharacterRequiredController < ApplicationController
  before_action :character_present?

  private

  def character
    @_character ||= Character.find(params[:character_id])
  end

  def character_present?
    render nothing: true, status: 422 unless character.present?
  end
end
