Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members do
    resources :broadcasts
  end
end
