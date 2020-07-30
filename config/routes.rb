# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :categories, only: %i[index show]

      resources :users, only: %(update) do
        collection do
          get :profile
        end
      end

      resources :travels, only: %i[index show create] do
        member do
          put :end_travel
        end
      end
    end
  end
end
