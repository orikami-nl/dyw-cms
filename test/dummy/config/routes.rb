Rails.application.routes.draw do

  get "navigation/show"

  mount Cms::Engine => "/cms"

	match '/:title', :to => 'navigation#show'

end
