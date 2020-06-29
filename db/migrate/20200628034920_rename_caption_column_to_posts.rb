class RenameCaptionColumnToPosts < ActiveRecord::Migration[5.2]
  def change
  	rename_column :posts, :caption, :content
  end
end
