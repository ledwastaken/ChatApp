Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  get 'messages/create'
  get 'conversations/index'
  get 'conversations/create'
  get 'conversations/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :conversations, only: [:index, :create, :show] do
    resources :messages, only: [:create]
  end

  # Defines the root path route ("/")
  root 'conversations#index'
end
