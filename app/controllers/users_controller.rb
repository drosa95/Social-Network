class UsersController < ApplicationController
 	before_action :authenticate_user!, :set_friends

	def index

	end

	def people
		@users = User.all.order(:name)
	end

	# GET users/:id
	def show
		# Usuario al cual el usuario actual esta accediendo
    	@user = User.find(params[:id])

    	# Solicitudes enviadas por el usuario actual al usuario que se esta accediendo
		@notifications_send = Notification.all.where(user_send_id: current_user.id , user_receive_id: @user.id)
  	end

  	private

  	def set_friends
  		@friends = current_user.friends
  	end

end