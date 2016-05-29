class CreateBuckets < ActiveRecord::Migration
  def change
    create_table :buckets do |t|
      # belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
