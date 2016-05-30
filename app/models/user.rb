class User < ActiveRecord::Base
  # attr_accessor :localuserimage_api_url

  has_many :shots
  # has_attached_file :localuserimage
  # validates_attachment_content_type :localuserimage, content_type: /\Aimage\/.*\Z/
end
