class AddAttachmentLocaluserimageToUsers < ActiveRecord::Migration
  def self.up
    add_attachment :users, :localuserimage
  end

  def self.down
    remove_attachment :users, :localuserimage
  end
end
