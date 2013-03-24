NetworkBuilder::Application.routes.draw do
  resources :locations

  get 'home/index'
  resources :networks do
    resources :points
  end
  
  root to: 'home#index'

end
