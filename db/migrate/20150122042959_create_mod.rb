class CreateMod < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.string  :role
      t.string  :trait
      t.integer :modifier
    end
  end
end
