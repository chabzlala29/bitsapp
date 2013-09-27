Bitsapp::Application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: {
    invitations: 'users/invitations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :static do
    get :welcome, on: :collection
    get :request_invitation, on: :collection
  end

  root to: "static#welcome"
end
