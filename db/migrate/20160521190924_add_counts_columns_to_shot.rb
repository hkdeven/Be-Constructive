class AddCountsColumnsToShot < ActiveRecord::Migration
  def change

    add_column :shots, :comments_recieved_count, :Integer
    add_column :shots, :followers_count, :Integer
    add_column :shots, :followings_count, :Integer
    add_column :shots, :likes_recieved_count, :Integer
    add_column :shots, :projects_count, :Integer
    add_column :shots, :rebound_recieved_count, :Integer
    add_column :shots, :shots_count, :Integer
    add_column :shots, :teams_count, :Integer
    add_column :shots, :can_upload_shot, :boolean
    add_column :shots, :type, :string
    add_column :shots, :pro, :boolean
  end
end
