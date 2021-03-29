class Api::V1::ServiceController < ApplicationController

def index
  @services = Service.all

  render json: @services, status: :ok
end


end
