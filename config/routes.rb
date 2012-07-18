Loanr::Application.routes.draw do
  get "users/index"

  devise_for :users

  resources :loans
  resources :friendships do
    member do
      delete :remove
    end
  end

  root :to => "loans#index"
end
