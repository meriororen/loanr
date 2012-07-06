Loanr::Application.routes.draw do
  resources :loans
  root :to => "loans#index"
end
