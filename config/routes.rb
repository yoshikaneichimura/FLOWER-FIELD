Rails.application.routes.draw do

  # namespace :user do
  #   get 'users/index'
  #   get 'users/show'
  #   get 'users/edit'
  # end
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
    resources :post_images, only: [:new,:create,:index,:show,:edit,:update,:destroy]
    get 'post_image/search' => 'post_images#search'
    resources :users, only: [:index,:show,:edit,:update]
  end

  devise_for :admin,skip: [:passwords], controllers: {
    registrations: 'admin/registrations',
    password: 'admin/passwords',
    sessions: "admin/sessions"
  }

  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
