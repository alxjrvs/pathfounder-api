class AddCharacterRelationToFeatList < ActiveRecord::Migration
  def change
    add_reference :feat_lists, :character, index: true
  end
end
