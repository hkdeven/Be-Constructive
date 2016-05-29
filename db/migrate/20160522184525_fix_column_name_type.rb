class FixColumnNameType < ActiveRecord::Migration
  def change
    rename_column :shots, :type, :dribbble_type
  end
end
