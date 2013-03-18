NetworkBuilder::Application.routes.draw do

  resources :network_links

  get 'home/index'
  resources :networks do
    resources :points
  end
  
  root to: 'home#index'

end
