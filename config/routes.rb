Rails.application.routes.draw do
  root "projects#index"

  resources :posts, only: :index
  resources :projects, only: :index

  namespace "admin" do
    resources :projects, only: :index
  end
end
