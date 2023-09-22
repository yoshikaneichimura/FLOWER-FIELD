Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'

  # post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  # post '/homes/guest_admin/sign_in', to: 'homes#guest_admin_sign_in'

  devise_for :users,skip: [:passwords], controllers:{
    registrations: "user/registrations",
    password: 'user/passwords',
    sessions: 'user/sessions'
  }

  devise_scope :user do
    post 'user/guest_sign_in',to: 'user/sessions#guest_sign_in'
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
