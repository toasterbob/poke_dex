Rails.application.routes.draw do
  resources :users
  resource :sessions

  resources :subs do
    resources :posts, only: [:new, :edit, :create, :update, :show, :destroy]
  end
end
