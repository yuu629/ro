Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users, 
              path: '', 
              path_names: {sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout'},
              controllers: {registrations: 'registrations'}

  get 'pages/home'
  get '/dashboard', to: 'users#dashboard'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/your_trips' => 'reservations#your_trips'

  post '/users/edit', to: 'users#update'
  
  resources :rooms, except: [:edit] do
    member do
      get 'photo_upload'
      get 'location'
      delete :delete_photo
      post :upload_photo
    end
    resources :reservations, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
