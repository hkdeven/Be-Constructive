class AddAttachmentLocalcommentimageToComments < ActiveRecord::Migration
  def self.up
    add_attachment :comments, :localcommentimage
  end

  def self.down
    remove_attachment :comments, :localcommentimage
  end
end
