class DropMods < ActiveRecord::Migration
  def change
    drop_table :mods
  end
end
