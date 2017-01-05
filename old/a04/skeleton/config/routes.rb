Links::Application.routes.draw do

  resources :users, only:[:new, :create, :show]
  resource :session, only:[:new, :create, :destroy]
  resources :links, only:[:new, :create, :show]
  resources :comments, only:[:new, :create, :show]
end
