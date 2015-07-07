class RemoveDeities < ActiveRecord::Migration
  def up
    drop_table :deities
  end

  def down
    create_table :deities do |t|
      t.string :name
      t.string :alignment
      t.text :domains, array: true, default: []
      t.text :subdomains, array: true, default: []
      t.string :favored_weapon
    end
  end
end
