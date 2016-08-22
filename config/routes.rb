Rails.application.routes.draw do
  devise_for :customers
  devise_for :employees

  root to: 'pages#home'





end
