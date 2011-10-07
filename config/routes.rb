Despachodepan::Application.routes.draw do

  root to: 'pages#actual'
  match '/lapanaderia' => 'pages#lapanaderia'
  match '/indice' => 'pages#indice'
  match '/seleccion' => 'pages#selection'
  match '/actual' => 'pages#actual'
  match '/thumb/:id' => 'pages#thumb'
  match '/index' => 'pages#index'

  namespace :admin do
    root to: 'cards#index'
    resources :cards, path: 'fichas' do
      resources :card_files, path: 'ficheros'
      resources :selections, path: 'seleccion'
      resources :slide_images, path: 'imagenes'
      resources :posts, path: 'actual'
      resources :slides, path: 'slides'
    end
    resources :slides, path: 'slides' do
      resource :position
    end
    resources :colors, path: 'colores'
    resources :tags do
      resource :position, path: 'posicion'
    end
    resources :card_files, path: 'ficheros'
    resources :slide_images, path: 'imagenes'
    resources :selections, path: 'seleccion'
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

  match '/:id' => 'pages#card'
  match '/editar/:id' => 'admin/cards#find'
end
