Rails.application.routes.draw do
  controller :sessions do
    get 'login', action: :new, as: :sessions_new
    post 'login', action: :create, as: :sessions_create
    delete 'logout', action: :destroy, as: :sessions_destroy

    get 'forgot_password', action: :forgot_password, as: :forgot_password
    post 'forgot_password', action: :forgot_password_check, as: :forgot_password_check
    get 'reset_password', action: :reset_password
    post 'reset_password', action: :change_password, as: :change_password
  end

  controller :user do
    get 'register', action: :register, as: :user_register
    post 'register', action: :create, as: :user_create
    get 'profile', action: :show, as: :user_show
    post 'profile', action: :update, as: :user_update
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
