Rails.application.routes.draw do
  devise_for :deviseusers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :author
  resources :book
  resources :genre
  resources :library
  resources :map_reader
  resources :user
  get '/links', to: 'pages#links'
  get '/library_info', to: 'pages#library_info'
  get '/user_info', to: 'pages#user_info'
  get '/search_library_name', to: 'pages#search_library_name'
  get '/search_user_name', to: 'pages#search_user_name'
  get '/search_user_email', to: 'pages#search_user_email'
  root to: 'pages#links'
  devise_scope :deviseuser do
    get "sign_up", to: "devise/registrations#new"
    get "sign_in", to: "devise/sessions#new"
    get "sign_out", to: "devise/sessions#destroy"
  end
end
