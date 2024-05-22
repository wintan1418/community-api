Rails.application.routes.draw do
  resources :communities do
    member do
      get :members
      get :posts
    end
    resources :memberships, only: [:create, :destroy]
    resources :posts, only: [:create, :index]
  end

  resources :posts, only: [:show, :update, :destroy] do
    resources :comments, only: [:create]
    resources :reactions, only: [:create, :destroy]
  end

  resources :comments, only: [:update, :destroy]

  resources :users, only: [:create, :update, :show] do
    member do
      post :apply_specialist
      post :apply_retailer
      post :approve_specialist
      post :approve_retailer
      post :approve_user
      post :make_admin
    end
  end

  resources :specialists, only: [:index, :create, :update, :destroy]
  resources :tutorials, only: [:index, :create, :update, :destroy]
  resources :retailers, only: [:index, :create, :update, :destroy]
end
