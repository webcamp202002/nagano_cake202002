Rails.application.routes.draw do
devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end

  devise_for :members, skip: :all
  devise_scope :member do
    get 'members/sign_in' => 'members/sessions#new', as: 'new_member_session'
    post 'members/sign_in' => 'members/sessions#create', as: 'member_session'
    delete 'members/sign_out' => 'members/sessions#destroy', as: 'destroy_member_session'
    get 'members/sign_up' => 'members/registrations#new', as: 'new_member_registration'
    post 'members' => 'members/registrations#create', as: 'member_registration'
    get 'members/password/new' => 'members/passwords#new', as: 'new_member_password'
  end

namespace :members do
    resources :cart_products,only: [:index,:edit,:update,:destroy,:destroy_all,:create]
    resources :destinations ,only: [:show,:index,:edit,:update,:create]
  		resources :products ,only: [:show,:index]
  		resources :orders ,only: [:new,:create,:index,:show]do
  			patch :toggle_status
  		end
  end
  delete 'members/cart_products/destroy_all'  => 'cart_products#destroy_all'
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/finish' => 'orders#finish'

 namespace :admins do
  		resources :products
  		resources :order_products,only: [:update] do
  			patch :toggle_status
  		end
  		resources :orders,only: [:show,:index,:update] do
  			patch :toggle_status
  		end
  		resources :user,only: [:show,:index,:edit,:update]
  		resources :genre,only: [:create,:index,:edit,:update]
 end
  root 'homes#top'

end
