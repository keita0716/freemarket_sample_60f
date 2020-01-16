Rails.application.routes.draw do
  devise_for :users,controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'authentication_phonenumbers', to: 'users/registrations#new_authentication_phonenumber'
    post 'authentication_phonenumbers', to: 'users/registrations#create_authentication_phonenumber'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  get 'credit_cards', to: 'credit_cards#new_credit_card'
  post 'credit_cards', to: 'credit_cards#create_credit_card'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :mypage, only: [:index, :edit] do
    resources :identification, only: [:index]
    resources :card, only: [:index]
  end
end
