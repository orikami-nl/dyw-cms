Rails.application.routes.draw do

  get "navigation/show_page"
	get "navigation/show_category"

  mount Cms::Engine => "/cms"

	match ':category_title/:page_title', :to => 'navigation#show_page'
	match ':category_title', :to => 'navigation#show_category'

end
