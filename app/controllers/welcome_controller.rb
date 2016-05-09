class WelcomeController < ApplicationController
	before_action :authenticate_user!, :set_posts

  	def index
  		@notifications = Notification.all.where(user_receive_id: current_user.id)
  		@count = @notifications.count
  	end

  	
  	private

  	def set_posts

      @posts = []

       current_user.friends.each do |friend|
          @user = User.find(friend.friend_id)
          @user.posts.order(:post_photo_updated_at).each do |post|
            @posts.append(post)
          end
        end

        current_user.posts.order(:post_photo_updated_at).each do |post|
          @posts.append(post)
        end

  	end
end