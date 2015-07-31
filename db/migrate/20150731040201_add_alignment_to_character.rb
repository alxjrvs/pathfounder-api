class AddAlignmentToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :alignment, :string
  end
end
