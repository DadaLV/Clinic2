Rails.application.routes.draw do
  get 'patients/index'
  devise_for :users

  ActiveAdmin.routes(self)

  authenticated :user, ->(user) { user.has_role?(:patient) } do
    root to: "patients#index", as: :patient_root
    
    resources :doctors, only: [:index] do
      resources :appointments, only: [:index, :show]
    end
  end

  authenticated :user, ->(user) { user.has_role?(:doctor) } do
    root to: "doctors#index", as: :doctor_root
    
    resources :patients, only: [:index] do
      resources :appointments, only: [:index, :show, :destroy]
    end
  end

  resources :appointments, only: [:index, :show, :new, :create, :update, :destroy] do
    delete :destroy, on: :member
    member do
      get :edit
    end
  end

  namespace :doctors do
    resources :appointments, only: [:index, :edit, :update]
  end

  root to: "profiles#index"
  match '*unmatched', to: 'application#not_found_method', via: :all
  
end
