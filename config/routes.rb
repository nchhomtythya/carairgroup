Rails.application.routes.draw do
  get 'contact/contact'
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  resources :cars do
    resources :bookings, only: %i[index new create edit update]
    resources :reviews, only: :create
  end
  resources :bookings, only: %i[destroy index edit update show]
  resources :reviews, only: :destroy

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "dashboard#dashboard", as: :dashboard
  get "contact", to: "contact#contact", as: :contact
end
