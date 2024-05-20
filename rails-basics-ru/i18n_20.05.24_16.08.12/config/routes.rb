# frozen_string_literal: true

Rails.application.routes.draw do
  scope ('/:locale'), locale: /en|ru/ do
    get 'home/index'
    root 'home#index'
    resources :post
  end
end
