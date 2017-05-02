Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  root 'home#index'

  namespace :api, format: :json  do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
    end
    namespace :v1 do
      #get '/users', controller: :users, action: :index
    end
  end

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

end
