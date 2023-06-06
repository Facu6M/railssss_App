Rails.application.routes.draw do
  root "home#dashboard"
  resources :products do
  end
end
