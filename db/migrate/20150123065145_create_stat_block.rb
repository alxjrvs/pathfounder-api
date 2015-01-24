class CreateStatBlock < ActiveRecord::Migration
  def change
    create_table :stat_blocks do |t|
      t.integer :wisdom_val
      t.integer :charisma_val
      t.integer :constitution_val
      t.integer :intelligence_val
      t.integer :strength_val
      t.integer :dexterity_val
      t.belongs_to :character, index: true
    end
  end
end
