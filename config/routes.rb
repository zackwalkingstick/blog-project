Rails.application.routes.draw do
  get 'homepage/index'
  get 'feed', to: 'entries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
