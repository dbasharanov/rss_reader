Rails.application.routes.draw do
  
  resources :feeds
  resources :feed_items, only: :destroy
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'feeds#index'
end
