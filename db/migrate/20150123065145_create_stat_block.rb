class CreateStatBlock < ActiveRecord::Migration
  def change
    create_table :stat_blocks do |t|
      t.integer :wisdom_val, default: 0
      t.integer :charisma_val, default: 0
      t.integer :constitution_val, default: 0
      t.integer :intelligence_val, default: 0
      t.integer :strength_val, default: 0
      t.integer :dexterity_val, default: 0
      t.belongs_to :character, index: true
    end
  end
end
