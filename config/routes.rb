Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tiny_homes do
    resources :bookings, only: [:new, :create]
    resources :home_amenities, only: [:new, :create, :edit, :update]
  end

  get '/my_tiny_homes', to: 'tiny_homes#my_index'

  resources :bookings, only: [:index, :show, :destroy, :edit, :update]
  resources :home_amenities, only: :destroy
end


# /tiny_homes GET tiny_homes  index

# /tiny_homes/new GET tiny_homes  new
# /tiny_homes POST  tiny_homes  create

# /tiny_homes/:id GET tiny_homes  show

# /tiny_homes/:id/edit  GET tiny_homes  edit
# /tiny_homes/:id/  PATCH tiny_homes  update

# /tiny_homes/:id/  DELETE  tiny_homes  destroy

# /tiny_homes/:id/bookings/new  GET bookings  new
# /tiny_homes/:id/bookings  POST  bookings  create

# /bookings/:id GET bookings  show

# /tiny_homes/:id/bookings/:id/edit GET bookings  edit
# /tiny_homes/:id/bookings/:id  PATCH bookings  update

# /bookings/:id DELETE  bookings  destroy

# /tiny_homes/:id/home_amenities/new  GET home_amenities  new
# /tiny_homes/:id/home_amenities  POST  home_amenities  create

# /tiny_homes/:id/home_amenities/:id/edit GET home_amenities  edit
# /tiny_homes/:id/home_amenities/:id  PATCH home_amenities  update

# home_amenities/:id  DELETE  home_amenities  destroy
