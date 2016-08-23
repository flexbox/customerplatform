Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :customers
  devise_for :employees

  namespace :employees do
    resources :dashboards, only: [:show]
    resources :projects, except: [:destroy]
    resources :phases
    resources :lots
    resources :buildings
    resources :units
    resources :parking_units
    resources :storage_units
    resources :consulting_hours
    # resources :suppliers TODO
    resources :news
    resources :documents
    resources :decisions
    resources :handovers
    resources :informations
    resources :site_visits
    resources :payments
  end

  namespace :customers do
    resources :dashboards, only: [:show]
    resources :units, only: [:show, :index]
    resources :parking_units, only: [:show, :index]
    resources :storage_units, only: [:show, :index]
    resources :consulting_hours, only: [:index]
    # resources :suppliers TODO
    resources :news, only: [:index, :show]
    resources :documents, only: [:index, :show]
    resources :decisions, only: [:index, :show, :edit, :update]
    resources :handovers, only: [:index, :show, :edit, :update] # for the remarks
    resources :informations, only: [:index, :show]
    resources :site_visits, only: [:index, :show]
    resources :payments, only: [:index, :show]
  end
end
