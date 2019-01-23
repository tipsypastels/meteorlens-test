Rails.application.routes.draw do
  devise_for :users,
    path: '',
    path_names: { sign_in: 'login', sign_out: 'logout' }

  get '/@:id', to: 'users#show', as: :user

  scope '/internal', as: :internal do
    post 'follow', to: 'followers#create'
    delete 'follow', to: 'followers#destroy', as: :unfollow
  end

  scope '/settings' do
    root 'settings#index', as: :settings

    get '/profile', to: 'settings#profile', as: :profile_settings
    get '/preferences', to: 'settings#preferences', as: :preferences_settings
    get '/account', to: 'settings#account', as: :account_settings

    post '/save', to: 'settings#save', as: :save_settings
  end

  resources :artworks, path: :art, except: :edit

  root to: 'timeline#index'
end
