class AddCharacterToMod < ActiveRecord::Migration
  def change
    add_reference :mods, :character, index: true
  end
end
