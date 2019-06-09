Rails.application.routes.draw do
  controller :user do
    get 'register', action: :register, as: :user_register
    post 'register', action: :create, as: :user_create
    get 'profile', action: :show, as: :user_show
    post 'profile', action: :update, as: :user_update
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
