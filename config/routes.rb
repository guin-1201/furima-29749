Rails.application.routes.draw do
  #get 'cards/new'
  get 'users/show'
  get 'items/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'cards', to: 'users/registrations#new_card'
    post 'cards', to: 'users/registrations#create_card'
  end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
  end
  resources :users, only: [:show, :update]
  #resources :cards, only: [:new, :create]
end
