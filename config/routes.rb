Rails.application.routes.draw do
  get 'comments/show'

  resources :categories
  # resources :users, only: [:show, :index]

  root "static_pages#home"
  devise_for :users, controller: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  as :user do
    resources :users, only: [:index, :show, :destroy] do
      member do
        get :like, :unlike
      end
    end
  end

  resources :posts
  resources :comments
  resources :votes, only: [:create, :destroy]
end
