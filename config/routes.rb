Rails.application.routes.draw do
  HemiIt::Application.routes.draw do
    root 'internal#index'

    # get 'auth/google_oauth2/callback' => 'internal#google_oauth2_callback'
    #
    # post 'create_login_session' => 'internal#create_login_session'
    # delete 'logout' => 'internal#logout'

    # get 'internal/index' => 'internal#index'

    get '/signup', to: 'users#new'
    post '/signup',  to: 'users#create'
    get '/login',   to: 'sessions#new'
    post '/login',   to: 'sessions#create'
    get '/logout',  to: 'sessions#destroy'
    resources :users

    get 'internal/dashboard' => 'internal#dashboard'

    get 'internal/person'   => 'internal#person'
    get 'internal/person_info' => 'internal#person_info'

    get 'internal/company'   => 'internal#company'

    get 'internal/contact'   => 'internal#contact'
    get 'internal/contact_create'   => 'internal#contact_create'
    get 'internal/contact_info' => 'internal#contact_info'

    get 'internal/deal'   => 'internal#deal'
    get 'internal/deal_create' => 'internal#deal_create'

    get 'internal/portfolio'   => 'internal#portfolio'
  end
end
