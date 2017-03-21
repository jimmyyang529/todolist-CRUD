class CategoryItemsController < ApplicationController
	before_action :find_category
	def index
		@items = @category.items

	end


	def show
  		@item = @category.items.find( params[:id] )
	end

	def edit
		@item = @category.items.find( params[:id] )
	end

	def update
		@item = @category.items.find( params[:id] )
		if @item.update( item_params )
	    	redirect_to category_items_url( @category )
	  	else
	    	render :action => :edit
	  	end
	end

	def destroy
		@item = @category.items.find( params[:id] )
		@item.destroy
		redirect_to category_items_url( @category )	 
	end


		
protected
	def find_category
		@category = Category.find(params[:category_id])
	end

	def item_params
		params.require(:item).permit(
			:title, 
			:due_date, 
			:decription, 
			:category_id,
			:keyword
			)
	end

end