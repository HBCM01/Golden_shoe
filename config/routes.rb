Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    authenticate :user, ->(user) { user.admin? } do
      mount Blazer::Engine, at: "blazer"
    end
  resources :basket_items
  resources :baskets
  resources :charges
  devise_for :admins
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shoes do
    member do
      get :hovercard
    resources :orders
    end
  end
end
