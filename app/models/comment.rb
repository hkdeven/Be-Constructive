class Comment < ActiveRecord::Base
  # attr_accessor :localcommentimage_api_url

  belongs_to :shot

  validates :localcommentimage,
            attachment_content_type: { content_type: /\Aimage\/.*\Z/}
  has_attached_file :localcommentimage
end
