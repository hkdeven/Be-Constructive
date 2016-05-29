class AddCountRecordsToShot < ActiveRecord::Migration
  def change
    add_column :shots, :viewcount, :Integer
    add_column :shots, :likes_count, :Integer
    add_column :shots, :comments_count, :Integer
    add_column :shots, :attachments_counts, :Integer
    add_column :shots, :rebounds_count, :Integer
    add_column :shots, :buckets_count, :Integer
  end
end
