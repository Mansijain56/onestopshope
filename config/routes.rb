Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks", confirmations: 'users/confirmations'}
  root to: "homes#index"
  
  get "/voucher", to: "vouchers#show", as: "voucher"
  resources :profiles
  resources :products do
    collection do
      get 'csv', defaults: {format: :csv}
    end
  end

  resources :orders do
    collection do
      get 'generate_invoice'
    end
  end

  resources :addresses
  
  resources :cart_items do 
    member do
      get 'increment'
      get 'decrement'
      post 'register'
      post 'create_view'
    end
  end

  resources :order_items do 
    member do
      post 'generate'
    end
  end

end
