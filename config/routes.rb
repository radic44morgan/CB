CouchbaseBeer::Application.routes.draw do
  root :to => 'welcome#index'
  resource :locator
  resource :dashboard
  resources :shoes
  resources :breweries
  resources :countries
  resources :favourites

  match '/auth/twitter/callback', :to => 'sessions#create'
end
