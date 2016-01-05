Rails.application.routes.draw do
  root 'contacts#index'
  resources :contacts, :custom_fields
end
