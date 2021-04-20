Rails.application.routes.draw do
  devise_for :users
  root 'home#index'


  resources :users do 
    member do
      post :follow
      post :unfollow
      get :questions
      get :answers
      get :followings
    end
  end

  resources :questions do
    resources :answers
  end

  resources :topics do
    member do
      post :follow
      post :unfollow
    end
  end
  resources :profiles
end
