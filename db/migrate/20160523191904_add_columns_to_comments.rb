class AddColumnsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :comment_created_at, :string
    add_column :comments, :body, :string
    add_column :comments, :user_avatar_url, :string
    add_column :comments, :user_id, :string
    add_column :comments, :user_name, :string

  end
end
