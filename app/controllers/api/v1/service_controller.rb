class Api::V1::ServiceController < ApplicationController

  def index
    @services = Service.all

    render json: @services, status: :ok
  end

  def create
    @services = Service.new(service_params)
    @services.users_id = current_user.id
     
    if @services.valid?
      @services.save
      
      render json: @services, status: :created
    else
      render json: {error: 'falha para criar service'},
      status: :not_acceptable
    end
  end


  def service_params
    params.require(:name)
    params.require(:category_directory)
    params.require(:description)
    params.require(:value)
    params.require(:quantity_of_service)
    params.permit(:name, :category_directory,
     :description, :value, :quantity_of_service)
  end

end
