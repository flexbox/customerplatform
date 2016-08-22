Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :customers
  devise_for :employees

  namespace :employees do

  end

  namespace :customers do

  end
end
