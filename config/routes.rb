Rails.application.routes.draw do
  root to: "articles#index"

  resources :articles, only: [:index, :show]

  get :admin, to: "admin/articles#index"

  namespace :admin do
    resources :articles
  end
end
