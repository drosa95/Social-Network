class ChangeDateFromPost < ActiveRecord::Migration
  def change
  	remove_column :posts, :date
  	add_column :posts, :date, :datetime
  end
end
