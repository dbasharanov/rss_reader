Rails.application.routes.draw do
  
  resources :feeds
  resources :feed_items#, only: :destroy
  
  post 'update_feeds/:id', to: 'feeds#update_feeds'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'feeds#index'
end
