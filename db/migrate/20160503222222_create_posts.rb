class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :image_url
      t.text :text
      t.string :place
      t.datetime :date
      t.integer :likes
      t.timestamps null: false
    end
  end
end
