Rails.application.routes.draw do
 get '/bands', to: 'bands#index'
 get '/bands/:id', to: 'bands#show'
 get '/records', to: 'records#index'
 get '/records/:id', to: 'records#show'
end
