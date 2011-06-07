Cms::Engine.routes.draw do
  resources :categories

  resources :pages
  root :to => 'pages#index'
end