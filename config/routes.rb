Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'
    resources :seasons
    resources :orders
  end

  resources :orders, only: [:create, :new, :show]
  devise_for :users

  root 'welcome#index'
end
