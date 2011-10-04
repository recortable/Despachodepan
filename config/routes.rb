Despachodepan::Application.routes.draw do

  root to: 'pages#actual'
  match '/lapanaderia' => 'pages#lapanaderia'
  match '/indice' => 'pages#indice'
  match '/seleccion' => 'pages#selection'
  match '/actual' => 'pages#actual'
  match '/thumb/:id' => 'pages#thumb'
  match '/index' => 'pages#index'
  match '/:id' => 'pages#card'
  match '/editar/:id' => 'admin/cards#find'

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
