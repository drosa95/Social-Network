class AddUserIdToFbPeople < ActiveRecord::Migration
  def change
    add_reference :fb_people, :user, index: true, foreign_key: true
  end
end
