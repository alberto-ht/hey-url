# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'urls#index'

  resources :urls, only: %i[index create show], param: :url
  get ':short_url', to: 'urls#visit', as: :visit

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :urls, only: [:index] do
        resources :clicks, only: [:index, :create]
      end
    end
  end

end
