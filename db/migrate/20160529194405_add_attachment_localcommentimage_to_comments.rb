class AddAttachmentLocalcommentimageToComments < ActiveRecord::Migration
  def self.up
    change_table :comments do |t|
      t.attachment :localcommentimage
    end
  end

  def self.down
    remove_attachment :comments, :localcommentimage
  end
end
