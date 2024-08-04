Rails.application.routes.draw do
  resources :entries
  get 'homepage/index'
end
