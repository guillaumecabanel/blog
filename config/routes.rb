Rails.application.routes.draw do
  root to: "pages#home"
  get :about, to: "pages#about"

  resources :articles, only: [:index, :show]

  get :admin, to: "admin/articles#index"

  namespace :admin do
    mount ActiveAnalytics::Engine, at: "analytics"
    resources :articles
  end
end
