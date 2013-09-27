Bitsapp::Application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    invitations: 'users/invitations',
  }

  root to: "static#welcome"
end
