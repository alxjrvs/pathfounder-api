class CreateFeatList < ActiveRecord::Migration
  def change
    create_table :feat_lists do |t|
      t.string :feat_1
      t.string :feat_2
      t.string :feat_3
    end
  end
end
