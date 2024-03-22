Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'

  devise_for :users, controllers:{
    registrations: "user/registrations",
    password: 'user/passwords',
    sessions: 'user/sessions'
  }
  devise_scope :user do
    post 'user/guest_sign_in',to: 'user/sessions#guest_sign_in'
  end

  namespace :user do
    resources :post_images, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorite, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'search' => 'post_images#search'

    resources :users, only: [:index,:show,:edit,:update] do
      get 'unsubscribes' => 'users#unsubscribe'
      patch 'withdraw' => 'users#withdraw'
      member do
          get :favorites
        end
      resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  devise_for :admin,skip: [:passwords], controllers: {
    registrations: 'admin/registrations',
    password: 'admin/passwords',
    sessions: "admin/sessions"
  }

  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/sessions#guest_sign_in'
  end
  namespace :admin do
    resources :post_images, only: [:index, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:destroy]
    end
    get 'search' => 'users#search'
    resources :users, only: [:index, :show, :edit ,:update] do
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
