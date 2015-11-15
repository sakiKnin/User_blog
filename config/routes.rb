Userblog::Application.routes.draw do

   
  devise_for :users
  get "/about", to: "pages#about"
	resources :post do 
		resources :comments
	end
	root "post#index"  
	 

end
