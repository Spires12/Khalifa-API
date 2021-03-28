class Api::V1::UserController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all 

    render json: @users, status: :ok 

  end

  def create    
    @users = User.create(user_params)
    if @users.valid?
      @users.save
      @token = encode_token(user_id: @users.id)

      render json: {user: @users, jwt: @token}, status: :created
    else 
      render json: {error: 'falha para criar usuario'},
      status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:email)
    params.require(:password)
    params.require(:password_confirmation)
    params.permit(:password, :password_confirmation,
     :first_name, :last_name, :date_of_birthday, :email)
  end 
end



