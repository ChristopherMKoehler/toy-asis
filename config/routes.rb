Rails.application.routes.draw do
  root 'welcome#index'

  namespace :admin do
    resources :manuscripts, only: [:index]
  end

  resources :inquiry, only: [:new]
  resources :manuscript, only: [:show]
end
