Despachodepan::Application.routes.draw do

  namespace :admin do
    root to: 'cards#index'
    resources :cards
    resources :colors
    resources :tags
  end

  namespace :backend do
    root to: 'cards#index'
    resources :cards
    resources :colors
    resources :images
    resources :slides
    resources :tags
    resources :users
  end
end
