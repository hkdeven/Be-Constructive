class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :designer_id, :string
    add_column :users, :designer_full_name, :string
    add_column :users, :designer_username, :string
    add_column :users, :designer_home_url, :string
    add_column :users, :designer_avatar_url, :string
    add_column :users, :designer_bio, :string
    add_column :users, :designer_location, :string
    add_column :users, :designer_bk_count, :string
    add_column :users, :designer_comments_received_count, :string
    add_column :users, :designer_follower_count, :string
    add_column :users, :designer_is_following_count, :string
    add_column :users, :designer_made_likes_count, :string
    add_column :users, :designer_received_likes_count, :string
    add_column :users, :designer_project_count, :string
    add_column :users, :designer_rebounds_received_count, :string
    add_column :users, :designer_added_shots_count, :string
    add_column :users, :designer_list_of_followers_url, :string
    add_column :users, :designer_following_list_url, :string
    add_column :users, :designer_list_of_shots_url, :string
  end
end
