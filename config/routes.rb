# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home_page/index'
  
  devise_for :managers

  root to: "home_page#index"

  resources :doctors, except: [ :show ]
  resources :patients, except: [ :show ]

end
