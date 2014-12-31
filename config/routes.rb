Rails.application.routes.draw do
  get 'invitations/show'

  root 'groups#new'

  resources :groups, only: [:index, :show, :new, :create]
  resources :invitations, only: :show

  #Facebook
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
end
