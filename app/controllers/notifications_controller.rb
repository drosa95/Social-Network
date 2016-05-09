class NotificationsController < ApplicationController
  before_action :authenticate_user!

  # GET /notifications
  # GET /notifications.json
  def index
    # solicitudes de amistad que ha recivido el usuario actual
    @receivers = Notification.all.where(user_receive_id: current_user.id)

    @senders = Notification.all.where(user_send_id: current_user.id)
  end

  # GET /notifications/new
  def new
    # Enviar solicitud
    if not params[:user] == nil
      @id = params[:user]
      @friend = User.find(@id)
      @notification = Notification.new(user_send_id: current_user.id, user_receive_id: @id, msg: current_user.name)
    else
    # Aceptar solicitud
      @id = params[:new_friend]
      @friend = User.find(@id)
      @notification = Notification.new(user_send_id: current_user.id, user_receive_id: @friend.id, msg: current_user.name)
      #annadir amigo
      @friend1 = current_user.friends.new(friend_id: @id)
      @friend2 = @friend.friends.new(friend_id: current_user.id)

      @friend1.save
      @friend2.save
    end 

    respond_to do |format|
      if @notification.save
        format.html { redirect_to @friend, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
      else
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

end