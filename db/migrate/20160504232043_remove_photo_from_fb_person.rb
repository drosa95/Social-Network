class RemovePhotoFromFbPerson < ActiveRecord::Migration
  def change
  	remove_column :fb_people, :photo_url
  end
end
