class UsersController < ApplicationController
    before_action :authorized, only: [:auto_login]

  # REGISTER
  def create
    @user = User.create!(user_params)
    if @user.valid?
      @user.save
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: {user: @user, token: token}
    else
      render json: {status: 500,
        error: 'User not found, please Signup'}
    end
  end


    # PATCH/PUT 
    def update
      @user = User.find_by(id: params[:id])
      @user.update!(user_params)
      render json: @user, status: :accepted
    end


  def auto_login
    render json: @user
  end
  

  private

  def user_params
    params.permit(:username, :password, :email, :avatar_url, :id)
  end
end
