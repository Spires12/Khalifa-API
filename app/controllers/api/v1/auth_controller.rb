class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
  def create
    @users = User.find_by(email: login_params[:email])

    if @users && @users.authenticate(login_params[:password])
      token = encode_token({user_id: @users.id})
      time = Time.now + 24.hours.to_i
      render json: {user: @users, jwt:{ token: token, exp: time.strftime("%Y-%m-%d %H:%M")}}, status: :accepted 
    else 
      render json: {menssage: "Invalid login email or password"}  ,
      status: :unauthorized
  
    end  
  end  
  private 

  def login_params
    params.require(:email)
    params.require(:password)
    params.permit(:email, :password)
  end
 end
