class ChangeSomethingsInUserTable < ActiveRecord::Migration
  def change
  	remove_column :users, :photo
  	remove_column :users, :birthdate

  end
end
