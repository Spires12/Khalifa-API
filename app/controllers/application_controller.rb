class ApplicationController < ActionController::API
  before_action :authorized 
  
  def authorized
    render json: {message: 'please log in'},
      status: :unauthorized unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    if decoded_token()
      user_id = decoded_token['user_id']
      @users = User.find_by(id: user_id)
    end
  end  

  def decoded_token
    if auth_header()
      token = auth_header.split(' ')[1]
      begin  
        JsonWebToken.decode(token)
        rescue JWT::DecodeError
      end
    end  
  end

  def auth_header
    request.headers['Authorization']
  end

  def encode_token(payload)
    JsonWebToken.encode(payload)
  end 

end
