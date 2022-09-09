Rails.application.routes.draw do


devise_for :users
get "home/about" => "homes#about", as: "about"
root to: "homes#top"
resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  resource :favorites, only: [:create, :destroy]
  resources:post_comments, only: [:create]
end
resources :users, only: [:show, :edit, :update, :index]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end