class ItemsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]



	def index
		@item = Item.new
		@items = Item.all
		@items = Item.page(params[:page]).per(5)

	end

	def new
		@item = Item.new
	end

	def show
 		@item = Item.find(params[:id])	
	end

	def create
		@item = Item.new(item_params)

		@item.user = current_user

		 if @item.save
		 			@item = Item.create(params[:id])
					flash[:alert] = "成功建立"
   		 		redirect_to items_url
 		else
		   render :action => :new
  		end
	end

	def edit
 		@item = Item.find(params[:id])
	end

	def update
 		@item = Item.find(params[:id])
 		@item.update(item_params)

 		redirect_to items_url
 
	end

	def destroy
		@item = Item.find(params[:id])
 		@item.destroy
		redirect_to items_url
	end

	private

	def item_params
 		params.require(:item).permit(
 								:title, 
 								:decription, 
 								:category_id, 
 								:tag_id,
 								:comment, 
 								:due_date,
 								:tag_ids => []
 								)
	end
end


