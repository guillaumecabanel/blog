Rails.application.routes.draw do
  root to: "pages#home"
  get :about, to: "page#about"

  resources :articles, only: [:index, :show]

  get :admin, to: "admin/articles#index"

  namespace :admin do
    resources :articles
  end
end
