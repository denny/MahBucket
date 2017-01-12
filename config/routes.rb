Rails.application.routes.draw do
  root to: 'items#index'
  
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :tags, as: :acts_as_taggable_on_tag
end
