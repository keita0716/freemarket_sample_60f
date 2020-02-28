Rails.application.routes.draw do
  devise_for :users,controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    # registration
    get 'signup', to: 'users/registrations#index',   as: :start_user_registration
    get 'authentication_phonenumbers', to: 'users/registrations#new_authentication_phonenumber'
    post 'authentication_phonenumbers', to: 'users/registrations#create_authentication_phonenumber'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  get 'credit_cards', to: 'credit_cards#new_credit_card'
  post 'credit_cards', to: 'credit_cards#create_credit_card'
  get 'logout', to: 'mypage#logout'
  post 'logout', to: 'mypage#logout'
  get 'purchase_confirmation', to: 'mypage#purchase_confirmation'
  post 'purchase_confirmation', to: 'mypage#purchase_confirmation'
  get 'saling_items', to: 'items#saling_items'
  post 'saling_items', to: 'items#saling_items'
  get 'trading_items', to: 'items#trading_items'
  post 'trading_items', to: 'items#trading_items'
  get 'soldout_items', to: 'items#soldout_items'
  post 'soldout_items', to: 'items#soldout_items'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :items, only: [:new, :create,:edit,:update]
  resources :mypage, only: [:index, :create, :edit, :update] do
    resources :identification, only: [:index]
    resources :card, only: [:index]
  end
  resources :items, only: [:show]
  resources :brands, only: [:index ,:show]

  # namespace :api do
  #   resources "destroy", controller: :items, only: :image_destroy, defaults: { format: 'json' } do
  #     collection do
  #       delete "image_destroy"
  #     end
  #   end
  # end

end
