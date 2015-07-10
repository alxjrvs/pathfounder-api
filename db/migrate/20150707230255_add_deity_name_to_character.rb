class AddDeityNameToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :deity_name, :string
  end
end
