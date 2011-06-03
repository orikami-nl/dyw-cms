Rails.application.routes.draw do

  mount Cms::Engine => "/cms"

	match '/:title', :to => 'cms/pages#showbylinkurl'

end
