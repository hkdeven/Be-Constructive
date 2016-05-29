class FixCountsColumnsForShots < ActiveRecord::Migration
  def change
    rename_column :shots, :comments_recieved_count, :comments_received_count
    rename_column :shots, :likes_recieved_count, :likes_received_count
    rename_column :shots, :rebound_recieved_count, :rebounds_received_count
  end
end
