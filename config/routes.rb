Rails.application.routes.draw do
  
  devise_for :users
  resources :playgrounds do
    resources :comments
  end
end
