Despachodepan::Application.routes.draw do

  namespace :admin do
    root to: 'cards#index'
    resources :cards do
      resources :card_files
    end
    resources :slides do
      resource :position
    end
    resources :colors
    resources :tags do
      resource :position
    end
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
