Rails.application.routes.draw do
  get 'reader/index'

 # get 'reader/read', to: 'reader#read'

	resources :my_files, controller: 'loader'
	resources :vendor_1, controller: 'reader'	
	root 'loader#index'
	get 'reader/my', to: 'reader#my'

resources :reader do
	get 'my'
	get 'read'
	get 'req'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
