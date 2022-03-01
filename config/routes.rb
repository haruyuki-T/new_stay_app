Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  devise_for :users, controllers: {
  sessions: 'users/sessions'
}

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'users/account', to: 'users/registrations#account'
  end

  get 'rooms/posts', to: 'rooms#posts'

  resources :rooms do
    resources :reservations
  end
  resources :users
  resources :reservations, :only => :index

end
