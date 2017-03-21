class Admin::CategoriesController < ApplicationController
	before_action :authenticate
	layout "admin"

	def index
		@categories = Category.all
	end

  protected

    def authenticate
       authenticate_or_request_with_http_basic do |user_name, password|
           user_name == "username" && password == "password"
       end
    end

end
