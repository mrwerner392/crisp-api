class LoginController < ApplicationController

  def create
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    if user && user.authenticate(password)
      render authentication_json(user.id)
    else
      render json: { message: 'Invalid username or password.' } and return
    end
  end

end