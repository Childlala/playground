Rails.application.routes.draw do
  
  resources :playgrounds do
    resources :comments
  end
end
