Rails.application.routes.draw do
  
  get 'about/new'
  get 'stats', to:'stats#new', as: :status
  get 'about', to:'about#new', as: :about
  get '/contests1', to: 'contests#index1', as: :contests1_path
  resources :ios
  get 'searchs/new'

  #resources :submissions
  #root

  # user extension paths
  #get '/users/:id/contests', to: 'cuis#index'

  # contest extension paths
  get '/contests/:id/standings', to: 'cuis#index'

  #get '/rating', to: 'users#index'
  get '/register', to:'users#new'
  #get '/rating', to: 'users#index', as: :users

  # session paths
  get 'submissions/:id', to:'error#index'
  get '/login',   to: 'sessions#new', as: :hello
  post '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # search paths
  get '/search', to:'contests#index'
  post '/search', to:'searchs#new'
  
  # submit

  get '/contests/:id/submit', to: 'submissions#new', as: :new_submit
  post '/contests/:id/submit', to: 'submissions#create', as: :submit
  resources :contests
  resources :cuis
  resources :users
  resources :submissions
  # apptlication_controller.rb filter below resources.
  
  # error paths

  get '/error', to:'error#index'
  get '*path' => redirect('/error')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
