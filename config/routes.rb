Rails.application.routes.draw do


    #DRIVERS
      get 'drivers', to: 'drivers#index', as: 'drivers'


    #RIDERS
  resources :riders





 end
