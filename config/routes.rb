Rails.application.routes.draw do

  namespace:api do 
    namespace:v1 do 
      resources :service
      resources :user 
      post '/login', to: 'auth#create'
    end
  end
end
