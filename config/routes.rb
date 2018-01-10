Rails.application.routes.draw do

  post '/users/favorites/:recipe_id', to: 'users#favorite_recipe', as: 'favorite_recipe'

  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:new, :create, :destroy]

  resources :recipes, except: [:destroy] do
    resources :ingredients, except: [:destroy]
    resources :tags, except: [:destroy]
  end

  root to: 'recipes#index'
end
