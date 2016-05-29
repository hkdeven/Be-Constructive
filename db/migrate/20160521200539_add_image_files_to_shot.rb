class AddImageFilesToShot < ActiveRecord::Migration
  def change
    add_column :shots, :images_hidpi, :string
    add_column :shots, :images_normal, :string
    add_column :shots, :images_teaser, :string
  end
end
