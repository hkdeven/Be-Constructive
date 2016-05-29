class AddDribbbleIdToShot < ActiveRecord::Migration
  def change
    add_column :shots, :dribbble_id, :Integer
  end
end
