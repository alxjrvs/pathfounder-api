class ChangeFeatListToUsePgArray < ActiveRecord::Migration
  def change
    remove_column :feat_lists, :feat_1
    remove_column :feat_lists, :feat_2
    remove_column :feat_lists, :feat_3
    add_column :feat_lists, :list, :text, array: true, default: []
  end
end
