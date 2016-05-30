class AddAttachmentLocalshotimageToShots < ActiveRecord::Migration
  def self.up
    add_attachment :shots, :localshotimage
  end

  def self.down
    remove_attachment :shots, :localshotimage
  end
end
