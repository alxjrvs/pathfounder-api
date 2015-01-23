class RemoveRace < ActiveRecord::Migration
  def change
    drop_table :races
  end
end
