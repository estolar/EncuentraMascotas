Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations'}
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :petlosts do
    collection do
      get :nearby
      get :loading_screen
      get :user_pets_losts
      get :download
      get :preview
      get :rescued_pets
    end
  end

  resources :petfounds do
    collection do
      get :user_pets_founds
    end
  end

  # , only: [:create, :new, :index, :destroy, :edit, :update, :show]
  # Defines the root path route ("/")
  # root "posts#index"
  get 'terms', to: 'pages#terms', as: :terms
  get 'privacy', to: 'pages#privacy', as: :privacy

  # Ruta para la vista detallada de la app Encuentra Mascotas
  get 'app_info', to: 'pages#app_info', as: :app_info
  resources :reviews, only: [:create]  # Solo habilitamos la acción 'create'

end
