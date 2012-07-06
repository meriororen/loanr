Loanr::Application.routes.draw do
  devise_for :users

  resources :loans
  root :to => "loans#index"
end
