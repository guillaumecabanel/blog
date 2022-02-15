Rails.application.routes.draw do
  resources :articles, only: [:index, :show]

  namespace :admin do
    resources :articles
  end
end
