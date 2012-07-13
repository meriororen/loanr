Loanr::Application.routes.draw do
  get "users/index"

  devise_for :users

  resources :friendships do
    member do
      delete :remove
    end
  end

  resources :loans
  root :to => "loans#index"
end
