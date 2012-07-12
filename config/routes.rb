Loanr::Application.routes.draw do
  get "users/index"

  devise_for :users

  get '/list_of_users',
    :to => 'users#index',
    :as => :list_of_users

  resources :friendships do
    member do
      delete :remove
    end
  end

  resources :loans
  root :to => "loans#index"
end
