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

    namespace :members do
      resources :members,only: [:index,:edit,:update,:show]
      resources :cart_products,only: [:index,:edit,:update,:destroy,:create]
      resources :destinations ,only: [:show,:index,:edit,:update,:create]
      resources :products ,only: [:show,:index]
      resources :orders ,only: [:new,:create,:index,:show]do
      patch :toggle_status
    end
  delete 'members/cart_products/destroy_all'  => 'cart_products#destroy_all'
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/finish' => 'orders#finish'
  patch 'members/change' => 'member#change'
end

  namespace :admins do
    get 'homes/top'
    resources :products
    resource :order_products,only: [:update] do
     patch :toggle_status
   end
   resources :orders,only: [:show,:index,:update] do
     patch :toggle_status
   end
   resources :members,only: [:show,:index,:edit,:update]
   resources :genres,only: [:create,:index,:edit,:update]
 end
 root 'homes#top'

end
