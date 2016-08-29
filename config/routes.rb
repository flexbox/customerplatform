Rails.application.routes.draw do
  root to: 'customers/dashboards#show'

#devise routes -----------------------------------------------------------------

  devise_for :customers,
    controllers: { invitations: "customers/invitations" }

  devise_for :employees,
    controllers: { omniauth_callbacks: "employees/omniauth_callbacks" }

#employee routes --------------------------------------------------------------

  namespace :employees do
    root to: 'dashboards#show'
    resource :dashboard, only: [:show]


    # /projects (bla)
    # /projects/:id # listing the phases
    resources :projects, except: [:destroy] do
      # /projects/:project_id/phases/new + create
      # /projects/:project_id/phases/:id # listing lots
      resources :phases do

        resources :news, only: [:new, :create]

        # /projects/:project_id/phases/:phase_id/lots/new + create + edit/update
        # resources :lots, only: []
      end

      resources :news, only: [:index, :show, :update, :destroy]

      # /projects/:project_id/lots/:id # listing buildings + parking lots
      resources :lots, only: [:new, :create, :index, :show, :edit, :update, :destroy] do

        # /projects/:project_id/lots/:lot_id/buildings/new + create + edit/update
        # resources :buildings, only: [:new, :create]
        # resources :parking_units, only: [:new, :create]
      end

      # /projects/:project_id/buildings/:id # listing units + storage units
      resources :buildings, only: [:new, :create, :index, :show, :edit, :update, :destroy] do

        # /projects/:project_id/buildings/:building_id/units/new + create
        # resources :units, only: [:new, :create]
        # resources :storage_units, only: [:new, :create]
      end

      resources :storage_units, only: [:new, :create, :index, :show, :edit, :update, :destroy]
      resources :parking_units, only: [:new, :create, :index, :show, :edit, :update, :destroy]

      # /projects/:project_id/units/:id
      resources :units, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
        resources :consulting_hours
        # resources :suppliers TODO
        #  resources :news
        resources :documents
        resources :decisions
        resources :handovers
        resources :informations
        resources :site_visits
        resources :payments
        resources :pictures
      end
    end
  end

  #customer routes -------------------------------------------------------------

  namespace :customers do

    root to: 'customers/dashboards#show'
    resource :dashboard, only: [:show]
    resource :profile, only: [:show, :edit, :update]

    resources :units, only: [:show, :index] do
      resource :dashboard,  only: [:show]

      resources :news,      only: [:index, :show]

      resources :decisions, only: [:index, :show] do
        member do
          patch :approve
          patch :reject
        end
      end

      resources :site_visits,   only: [:index, :show]
      resources :handovers,     only: [:index, :edit, :update] # for the remarks
      resources :payments,      only: [:index, :show]
      resources :documents,     only: [:index]
      resources :pictures,      only: [:index, :show]

      resources :informations, only: [:index, :show]

      resources :parking_units, only: [:show, :index]
      resources :storage_units, only: [:show, :index]

      resources :helpdesk_tickets, only: [:show, :index, :new, :create]
      # resources :suppliers TODO
    end
  end
end
