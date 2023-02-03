Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  # resources :bookings do
  # end
  # get '/bookings/:id/edit', to: 'bookings#edit', as: 'edit_booking'
  # patch '/bookings/:id', to: 'bookings#update'

  resources :articles do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[index edit show update destroy]
end
