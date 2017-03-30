class ItemsController < ApplicationController
	before_action :authenticate_user!, :except => [:index]



	def index
		@item = Item.new
		@items = Item.all
		#每頁顯示5筆資料，並且依最後回覆數最高的文章做排列
		@items = Item.page(params[:page]).per(5).order(comments_count: :desc)

		#依最後回覆時間做文章排列
		#@items = Item.page(params[:page]).per(5).order(created_at: :desc)
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

			respond_to do |format|
				format.js # create.js.erb
				format.html { redirect_to items_path }
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

		respond_to do |format|
			# :remote => true
			format.js # destroy.js.erb
			format.html { redirect_to items_path }
		end
	end

	def like
		@item = Item.find( params[:id] )

		unless @item.is_liked_by(current_user)
			Like.create( :item => @item, :user => current_user )
		end

		respond_to do |format|
			format.js
			format.html { redirect_to items_path }
		end
	end

	def unlike
		@item = Item.find(params[:id])
		like = @item.find_like(current_user)
		like.destroy

		respond_to do |format|
			format.js { render "like" } # like.js.erb
			format.html { redirect_to items_path }
		end
	end

	def about
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
