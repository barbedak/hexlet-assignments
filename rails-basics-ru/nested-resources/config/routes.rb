# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homes#index'

  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[edit create update destroy]
    end
  end
end
