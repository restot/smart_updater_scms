Rails.application.routes.draw do
	resources :my_files, controller: 'loader'
  root 'loader#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
