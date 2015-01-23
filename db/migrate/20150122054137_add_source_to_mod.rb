class AddSourceToMod < ActiveRecord::Migration
  def change
    change_table :mods do |t|
      t.integer :source_id
      t.string  :source_type
    end
  end
end
