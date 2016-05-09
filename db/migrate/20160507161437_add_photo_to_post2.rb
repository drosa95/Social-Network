class AddPhotoToPost2 < ActiveRecord::Migration
  def change
  	add_attachment :posts, :photo_post
  end
end
