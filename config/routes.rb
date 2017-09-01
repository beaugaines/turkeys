Rails.application.routes.draw do

  namespace :admin do
    root 'application#index'
    resources :seasons
  end

  devise_for :users

  root 'welcome#index'
end
