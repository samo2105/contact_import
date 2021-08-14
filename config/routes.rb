Rails.application.routes.draw do
  get 'contacts/index'
  post 'csv_files/create'
  devise_for :users
  root to: 'contacts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
