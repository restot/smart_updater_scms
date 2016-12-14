Rails.application.routes.draw do
  get 'reader/index'

  get 'reader/read'

	resources :my_files, controller: 'loader'
	
	root 'loader#index'
	get 'reader/my', to: 'reader#my'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
