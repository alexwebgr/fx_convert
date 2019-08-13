Rails.application.routes.draw do
  get 'dashboard/rate_display'
  post 'dashboard/create_rate_display'
  get 'dashboard/management'
  get 'dashboard/import_currencies'
  delete 'dashboard/destroy_fx_pair'

  resources :fx_pairs
  resources :currencies

  root 'dashboard#rate_display'
end
