class AddMoreColumnsToDeities < ActiveRecord::Migration
  def change
    add_column :deities, :domains, :text, array: true, default: []
    add_column :deities, :subdomains, :text, array: true, default: []
    add_column :deities, :favored_weapon, :string
  end
end
