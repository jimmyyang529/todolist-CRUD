Rails.application.routes.draw do

  root :to => "items#index"
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
  	resources :items, :controller => 'category_items'

  	collection do
  		get :latest
  		post :bulk_update
  	end

  	member do
  		get :dashboard
  	end

	end

	namespace :admin do
		resources :categories
	end

  resources :items
end
