Rails.application.routes.draw do
  get '/bands', to: 'bands#index'
  get '/bands/new', to: 'bands#new'
  post '/bands', to: 'bands#create'
  get '/bands/:id', to: 'bands#show'
  get '/bands/:id/records/new', to: 'band_records#new'
  post 'bands/:id/records', to: 'band_records#create'
  get '/records', to: 'records#index'
  get '/records/:id', to: 'records#show'
  get '/bands/:band_id/records', to: 'band_records#index'
  get '/bands/:id/edit', to: 'bands#edit'
  patch '/bands/:id', to: 'bands#update'
end
