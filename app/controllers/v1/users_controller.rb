class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    username = params[:username]
    password = params[:password]

    user = User.create(username: username, password: password)
    if user.valid?
      render authentication_json(user.id)
    else
      render json: { message: user.errors.full_messages.first }, status: :unprocessible_entity
    end
  end

end