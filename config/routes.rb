Rails.application.routes.draw do

  resources :groups, only: [:index, :show, :new, :create]
end
