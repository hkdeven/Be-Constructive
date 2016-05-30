class Comment < ActiveRecord::Base
  # attr_accessor :localcommentimage_api_url

  belongs_to :shot
  # has_attached_file :localcommentimage
  # validates_attachment_content_type :localcommentimage, content_type: /\Aimage\/.*\Z/
end
