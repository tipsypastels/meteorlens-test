Rails.application.routes.draw do
  devise_for :users
  get '/@:id', to: 'users#show', as: :user

  resources :artworks, path: :art

  root to: 'timeline#index'
end
