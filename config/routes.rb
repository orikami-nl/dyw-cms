Cms::Engine.routes.draw do

  resources :categories do
	  resources :pages
	end

  root :to => 'categories#index'
end
