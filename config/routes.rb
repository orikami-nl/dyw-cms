Cms::Engine.routes.draw do
  resources :files
  resources :categories do
	  resources :pages
	end

	put "move_category_up", :to => "categories#move_category_up"
	get "move_category_up", :to => "categories#move_category_up"
	put "move_category_down", :to => "categories#move_category_down"
	get "move_category_down", :to => "categories#move_category_down"

	put "move_page_up", :to => "pages#move_page_up"
	get "move_page_up", :to => "pages#move_page_up"
	put "move_page_down", :to => "pages#move_page_down"
	get "move_page_down", :to => "pages#move_page_down"

  root :to => 'categories#index'
end
