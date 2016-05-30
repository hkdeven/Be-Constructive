class AddAttachmentLocaluserimageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :localuserimage
    end
  end

  def self.down
    remove_attachment :users, :localuserimage
  end
end
