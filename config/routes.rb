Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :shrines, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create, :show]
    resources :goshuins, only: [:create, :show]
    resources :builds, only: [:create, :show]
    resources :histories, only: [:create, :show]
    resources :natures, only: [:create, :show]
    resources :festivals, only: [:create, :show, :index]
  end
end
