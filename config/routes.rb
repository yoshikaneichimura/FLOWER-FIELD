Rails.application.routes.draw do

  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  post '/homes/guest_admin/sign_in', to: 'homes#guest_admin_sign_in'

  devise_for :users,skip: [:passwords], controllers:{
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
