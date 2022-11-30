Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :articles
  get "/profile", to: "articles#profile", as: :profile
end
