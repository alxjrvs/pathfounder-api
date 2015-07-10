require 'rails_helper'

describe Api::V1::CharactersController, type: :controller do
  context "create" do
    before do
      @name = "Ragnar"
      post :create, {character: {name: @name, deity_name: "Stag-Horned Hunter" }}
    end

    it "returns successful" do
      expect(response).to be_success
    end

    it "creates a new character with the correct name" do
      character = Character.where(name: @name)
      expect(character.count).to eql 1
      expect(character.first.name).to eql @name
      expect(character.first.deity.name).to eq "Stag-Horned Hunter"
    end
  end

  context "get" do
    before do
      @character = create :character
      get :show, { id: @character.id }
    end

    it 'returns the correct character' do
      expect(json["character"]["name"]).to eql @character.name
      expect(json["character"]["id"]).to eql @character.id
    end

    it "includes the character's deity" do
      expect(json["character"]["deity"]["name"]).to eq "Azathoth"
    end

  end
end
