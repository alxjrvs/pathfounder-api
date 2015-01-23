class ChangeRaceOnCharacterToPolymorphic < ActiveRecord::Migration
  def change
    remove_column :characters, :race_id
    change_table :characters do |t| 
      t.references :race, polymorphic: true, index: true
    end
  end
end
