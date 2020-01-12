Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tops#index'
  resources :items
  resources :mypage, only: [:index, :create, :edit, :update] do
    resources :identification, only: [:index]
  end
end
