Rails.application.routes.draw do
  devise_for :customers
  devise_for :employees

  root to: 'pages#home'

  namespace 'employees' do

  end

  namespace 'customers' do

  end

end
