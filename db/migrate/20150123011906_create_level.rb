class CreateLevel < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.belongs_to :character, index: true
      t.integer :pf_class_id
      t.string  :pf_class_type
    end
  end
end
