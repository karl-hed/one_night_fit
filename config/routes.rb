Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :bookings do
  end
  # get '/bookings/:id/edit', to: 'bookings#edit', as: 'edit_booking'
  patch '/bookings/:id', to: 'bookings#update'

  resources :articles
end
