Rails.application.routes.draw do
  devise_for :users
  root to: "homes#index"
  resources :shrines, only: [:index, :new, :create, :show] do
    resources :comments
    resources :goshuins
  end
end
