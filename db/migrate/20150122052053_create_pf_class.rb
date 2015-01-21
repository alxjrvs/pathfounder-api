class CreatePfClass < ActiveRecord::Migration
  def change
    create_table :pf_classes do |t|
      t.belongs_to :character, index: true
    end
  end
end
