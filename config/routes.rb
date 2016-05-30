Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


  root 'results#home'
  resources :results
  get 'ratings' => 'results#new'
  post 'results' => 'results#create'

  get 'new_wrestler' => 'wrestler#new'
  post 'wres_results' => 'wrestler#show'

  end
