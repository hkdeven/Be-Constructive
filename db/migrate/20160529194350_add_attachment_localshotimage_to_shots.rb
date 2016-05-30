class AddAttachmentLocalshotimageToShots < ActiveRecord::Migration
  def self.up
    change_table :shots do |t|
      t.attachment :localshotimage
    end
  end

  def self.down
    remove_attachment :shots, :localshotimage
  end
end
