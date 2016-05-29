class AddMoreUrlsToShot < ActiveRecord::Migration
  def change
    add_column :shots, :followers_url, :string
    add_column :shots, :following_url, :string
    add_column :shots, :shots_url, :string
    add_column :shots, :teams_url, :string
    add_column :shots, :team, :string
  end
end
