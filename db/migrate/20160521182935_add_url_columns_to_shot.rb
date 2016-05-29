class AddUrlColumnsToShot < ActiveRecord::Migration
  def change
    add_column :shots, :html_url, :string
    add_column :shots, :attachments_url, :string
    add_column :shots, :buckets_url, :string
    add_column :shots, :comments_url, :string
    add_column :shots, :likes_url, :string
    add_column :shots, :projects_url, :string
    add_column :shots, :animated, :boolean
    
  end
end
