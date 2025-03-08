# Rails.application.routes.draw do
#   devise_for :users, controllers: { sessions: 'users/sessions' }, skip: [:sessions]
# as :user do
#   get 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
# end


#   root to: "pages#home"  # Ensure root is set

#   authenticated :user do
#     root 'pages#home', as: :authenticated_root
#   end

#   unauthenticated do
#     root 'devise/sessions#new', as: :unauthenticated_root
#   end

#   get 'pages/home', to: 'pages#home', as: :home

#   get "up" => "rails/health#show", as: :rails_health_check
# end

Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]  # Skip sessions and registrations to define custom routes

  devise_scope :user do
    get    'users/sign_in',  to: 'devise/sessions#new',     as: :new_user_session
    post   'users/sign_in',  to: 'devise/sessions#create',  as: :user_session
    delete 'users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session

    get 'users/sign_up', to: 'devise/registrations#new', as: :new_user_registration
    post 'users', to: 'devise/registrations#create', as: :user_registration
  end

  root 'pages#home'
  get 'pages/home'
end
