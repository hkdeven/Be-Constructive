class Shot < ActiveRecord::Base
belongs_to :user
has_many :comments

  def self.search(query, options={})
    where("title LIKE ? OR description LIKE ? OR tags LIKE ?", ''"%#{query}%"'', ''"%#{query}%"'', ''"%#{query}%"'')
  end

end
