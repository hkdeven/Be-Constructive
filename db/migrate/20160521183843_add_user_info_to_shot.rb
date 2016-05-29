class AddUserInfoToShot < ActiveRecord::Migration
  def change
    add_column :shots, :user_name, :string
    add_column :shots, :user_username, :string
    add_column :shots, :user_html_url, :string
    add_column :shots, :user_avatar_url, :string
    add_column :shots, :user_bio, :string
    add_column :shots, :user_location, :string
  end
end
