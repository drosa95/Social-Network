class Post < ActiveRecord::Base

	belongs_to :user
	has_many :comments
	after_create :set_likes
	has_attached_file :photo_post, :styles => { :large => "600x400", :medium => "300x300", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :photo_post, :content_type => /\Aimage\/.*\Z/

	private	

	def set_likes
		self.likes = 0
	end

end