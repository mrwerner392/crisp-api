class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]
  before_action :get_user, only: [:show, :update]

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

  def show
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { message: @user.errors.full_messages.first }, status: :unprocessible_entity
    end
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :username, :email)
  end

end