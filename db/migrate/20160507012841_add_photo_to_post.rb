class AddPhotoToPost < ActiveRecord::Migration
  def change
  	remove_column :posts, :image_url
  	add_attachment :posts, :post_photo
  end
end
