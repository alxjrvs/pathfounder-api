class CreateStatBlock < ActiveRecord::Migration
  def change
    create_table :stat_blocks do |t|
      t.integer :wisdom
      t.integer :charisma
      t.integer :constitution
      t.integer :intelligence
      t.integer :strength
      t.integer :dexterity
      t.belongs_to :character, index: true
    end
  end
end
