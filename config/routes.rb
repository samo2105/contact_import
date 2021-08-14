Rails.application.routes.draw do
  resources :csv_files, only: [:index, :create]
  resources :contacts, only: [:index]
  devise_for :users
  root to: 'contacts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
