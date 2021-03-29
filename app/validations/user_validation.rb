module Validate

  class User
    attr_accessor :first_name, :last_name, :date_of_birthday,
      :email, :password, :password_confirmation




    def initialize(params = {})
      @first_name = params[:first_name]
      @last_name = params[:last_name]
      @date_of_birthday = params[:date_of_birthday]
      @email = params[:email]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
    end

  

end