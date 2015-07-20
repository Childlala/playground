Rails.application.routes.draw do
  devise_for :admins
  resources :kits do
    resources :playgrounds
  end
  root             'playgrounds#index'
  devise_for :users
  resources :playgrounds do
    resources :comments
  end
end
