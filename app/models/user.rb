class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :name, presence: true
  validates :lastname, presence: true

  has_attached_file :photo, styles: {medium: "300x200", small: "140x140", thumb: "100x100"}, :default_url => "/images/:style/missing.png" 
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/    
	has_many :posts
	has_and_belongs_to_many :user
	has_many :comments
	has_many :notifications
  has_many :friends

end
