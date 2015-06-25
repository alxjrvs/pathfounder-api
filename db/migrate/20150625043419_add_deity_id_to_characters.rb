class AddDeityIdToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :deity_id, :integer
  end
end
