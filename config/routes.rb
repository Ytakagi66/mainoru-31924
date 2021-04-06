Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :shrines, only: [:index, :new, :create, :show] do
    resources :comments, only: [:create, :show, :index]
    resources :goshuins, only: [:create, :show, :index]
    resources :builds, only: [:create, :show, :index]
    resources :histories, only: [:create, :show, :index]
    resources :natures, only: [:create, :show, :index]
    resources :festivals, only: [:create, :show, :index]
  end
end
