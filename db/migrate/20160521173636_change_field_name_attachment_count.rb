class ChangeFieldNameAttachmentCount < ActiveRecord::Migration
  def change
    rename_column :shots, :attachments_counts, :attachments_count
  end


end
