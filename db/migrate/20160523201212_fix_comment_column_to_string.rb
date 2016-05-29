class FixCommentColumnToString < ActiveRecord::Migration
  def change
    change_column :comments, :comment_id, :string
  end
end
