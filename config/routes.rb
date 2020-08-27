# frozen_string_literal: true

Rails.application.routes.draw do
  get 'dashboard/index'
  
  devise_for :managers

  root to: "dashboard#index"

  resources :doctors, except: [ :show ]
  resources :patients, except: [ :show ]
  resources :appointments, except: [ :show, :destroy ]

end
