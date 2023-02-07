Rails.application.routes.draw do
  resources :leases, only: [:create, :destroy]
  resources :tenants, except: [:show]
  resources :apartments, except: [:show]
end
