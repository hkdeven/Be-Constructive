class User < ActiveRecord::Base
  # attr_accessor :localuserimage_api_url

  has_many :shots
  validates :localuserimage,
            attachment_content_type: { content_type: /\Aimage\/.*\Z/}
  has_attached_file :localuserimage
end
