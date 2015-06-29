Rails.application.routes.draw do
  root             'playgrounds#index'
  devise_for :users
  resources :playgrounds do
    resources :comments
  end
end
