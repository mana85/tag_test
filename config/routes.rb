Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts, except: %w[index]
  resources :tags, only: %w[index show destroy]
end
