class RenameTypeColumnToCategories < ActiveRecord::Migration[5.2]
  def change
  	rename_column :categories, :type, :genre
  end
end
