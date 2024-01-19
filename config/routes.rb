Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }

  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  post 'sign_up', to: 'registrations#create'

  match 'sign_up', to: 'registrations#options', via: [:options]
  resources :users
  get 'user_info', to: 'users#show'
end
