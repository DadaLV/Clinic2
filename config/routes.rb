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
      resources :appointments, only: [:show]
    end
  end

  resources :appointments, only: [:index, :new, :create, :destroy] do
    patch :close, on: :member
    delete :destroy, on: :member
  end

  root "profiles#index"
end
