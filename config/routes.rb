Rails.application.routes.draw do
  devise_for :users

  root 'reservations#index'


  resources :users, only: [:index, :show, :create, :destroy, :edit, :new, :update]
  resources :shops, only: [:index, :new, :create, :edit, :update, :destroy, :show]
  resources :reservations, only: [:index, :create, :destroy]

  resources :shops do
    resources :reservations, only: [:index, :show, :create, :destroy, :new]

  end


end
