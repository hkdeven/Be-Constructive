class Shot < ActiveRecord::Base
  # attr_accessor :localshotimage_api_url
  #
  belongs_to :user
  has_many :comments

  validates :localshotimage,
            attachment_content_type: { content_type: /\Aimage\/.*\Z/}
  has_attached_file :localshotimage

  def self.search(query, options={})
    where("title LIKE ? OR description LIKE ? OR tags LIKE ?", ''"%#{query}%"'', ''"%#{query}%"'', ''"%#{query}%"'')
  end

end
