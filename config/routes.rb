Rails.application.routes.draw do
  devise_for :administrators, controllers: {
    sessions: 'administrators/sessions',
    passwords: 'administrators/passwords'

  }

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  namespace :admin do
      resources :administrators
      resources :customers
      resources :galleries
      resources :services
      resources :bookings
      resources :feedbacks, only: [:index, :show, :destroy]
      root to: "administrators#index"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/home', to: 'dashboards#index', as: :home
  get '/services', to: 'dashboards#services', as: :services
  get '/gallery', to: 'dashboards#gallery', as: :gallery
  
  get '/booking', to: 'bookings#new', as: :new_booking
  post '/booking', to: 'bookings#create', as: :create_booking
  get '/booking/:id/status', to: 'bookings#status', as: :booking_status

  get '/booking/:id/feedback', to: 'feedbacks#new', as: :new_booking_feedback
  post '/booking/:id/feedback', to: 'feedbacks#create', as: :create_booking_feedback

  root 'dashboards#index'
end
