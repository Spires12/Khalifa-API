class v1::UserController < ApiController
  def index
    @users = User.all   
  end

  def new
  end

  def create
    @users = User.Create(
                          name: params[:name],
                          date_of_birthday: params[:date_of_birthday],
                          email: params[:email],
                          password: params[:password]
    )
    render :show
  end

  def show
  end
end
