class CategoriesController < ApplicationController
	def index
		@category = Category.all

		if	params[:keyword]
			@categories = Category.where( [ "name like ?", "%#{params[:keyword]}%" ] )
  		else
    		@categories = Category.all
  		end

  			@categories = @categories.page(params[:page]).per(5)
	end

	def new
		@category = Category.new		
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to categories_url, notice: 'Category was sucessfully created.'
		else
			render :action => :new
		end
	end

	#GET/categories/latest
	def latest
		@categories = Category.order("id DESC").limit(3)
	end

	#POST/categories/bulk_delete
	#def bulk_delete
		#Category.destroy_all
		#redirect_to :back
	#end

	#GET/categories/:id/dashboard
	def dashboard
		@category = Category.find(params[:id])
	end

	def bulk_update
		ids = Array( params[:ids])

		categories = Category.where(id: params[:ids])

		 if params[:commit] == "Publish"
    		categories.each{ |e| e.update( :status => "published" ) }
  		elsif params[:commit] == "Delete"
    		categories.each{ |e| e.destroy }
  		end

		redirect_to :back
	end


	def show	
	end


	def edit
		@category = Category.find(params[:id])
	end


	def update
 		@category = Category.find(params[:id])
 		@category.update(category_params)

 		redirect_to categories_url
	end

	def destroy
		@category = Category.find(params[:id])
 		@category.destroy
 		redirect_to categories_url
	end


protected

	def category_params
		params.require(:category).permit(:category_name, :status, :is_public)
	end


end
