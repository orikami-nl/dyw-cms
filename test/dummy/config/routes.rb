Rails.application.routes.draw do

  get "navigation/show"

  mount Cms::Engine => "/cms"

	match '/:page_title', :to => 'navigation#show_page'

end
