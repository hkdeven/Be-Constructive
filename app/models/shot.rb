class Shot < ActiveRecord::Base
  # attr_accessor :localshotimage_api_url
  #
  belongs_to :user
  has_many :comments
  # has_attached_file :localshotimage
  # validates_attachment_content_type :localshotimage, content_type: /\Aimage\/.*\Z/

  def self.search(query, options={})
    where("title LIKE ? OR description LIKE ? OR tags LIKE ?", ''"%#{query}%"'', ''"%#{query}%"'', ''"%#{query}%"'')
  end

end
