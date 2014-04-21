Matcher::Application.routes.draw do
  root "groups#index"
  resources :groups

  # match 'auth/:provider/callback', to: 'sessions#create'
  # match 'auth/failure', to: redirect('/')
  # match 'signout', to: 'sessions#destroy', as: 'signout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
