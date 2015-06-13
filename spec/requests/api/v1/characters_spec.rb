require 'rails_helper'

describe "Characters API" do
  context "create" do
    before do
      @name = "Ragnar"
      post '/api/v1/characters', {character: {name: @name }}
    end

    it "returns successful" do
      expect(response).to be_success
    end

    it "creates a new character with the correct name" do
      character = Character.where(name: @name)
      expect(character.count).to eql 1
      expect(character.first.name).to eql @name
    end
  end

  context "get" do
    before do
      @character = create :character
      get "api/v1/characters/#{@character.id}"
    end

    it 'returns the correct character' do
      character = JSON.parse(response.body)["character"]
      expect(character["name"]).to eql @character.name
      expect(character["id"]).to eql @character.id
    end

  end
end
