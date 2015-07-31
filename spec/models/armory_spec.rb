require 'rails_helper'

describe Armory do
  let(:armory) { create :armory }

  it "has a valid factory" do
    expect(armory).to be_valid
  end

  it "validates that armor is armor" do
    armory.armor = "Darkseid's skirt"
    expect(armory).to_not be_valid
  end

  it "validates that shields are shields" do
    armory.shield = "Steven's Shield"
    expect(armory).to_not be_valid
  end

  it "validates that weapons are weapons" do
    armory.weapon_list = ["Grapthar's Hammer"]
    expect(armory).to_not be_valid
  end
end
