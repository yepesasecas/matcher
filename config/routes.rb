Matcher::Application.routes.draw do
  root "groups#index"
  resources :groups
end
