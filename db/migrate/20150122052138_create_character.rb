class CreateCharacter < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
    end
  end
end
