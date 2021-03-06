
Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }
  devise_scope :member do
    post 'members/guest_sign_in', to: 'members/sessions#new_guest'
  end

  namespace :members do
    get 'members/withdraw'=> 'members#withdraw'
    patch 'members/change' => 'members#change'
    put 'members/change' => 'members#change'
    resources :members,only: [:index,:edit,:update,:show]
    resources :cart_products,only: [:index,:create,:update,:destroy]
    resources :destinations ,only: [:show,:index,:edit,:update,:create,:destroy]
    resources :products ,only: [:show,:index]
    get 'orders/confirm' => 'orders#confirm'
    get 'orders/finish' => 'orders#finish'
    resources :orders ,only: [:new,:create,:index,:show]
  delete 'members/cart_products/destroy_all'  => 'cart_products#destroy_all'
end

namespace :admins do
  get 'homes/top'
  get '/search' => 'searches#search'
  resources :searches,only: [:index]
  resources :products
  resources :order_products,only: [:update]
 resources :orders,only: [:show,:index,:update]
 resources :members,only: [:show,:index,:edit,:update]
 resources :genres,only: [:create,:index,:edit,:update]
end
root 'homes#top'

end
