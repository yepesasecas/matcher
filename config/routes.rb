Rails.application.routes.draw do
  root 'groups#new'

  resources :groups, only: [:index, :show, :new, :create]

  #Facebook
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
