class Item < ApplicationRecord
	#validates_presence_of :title, :due_date
	#before_create :check_title
	belongs_to :category
	has_many :tag_itemships
	has_many :tags, :through => :tag_itemships
	belongs_to :user
	has_many :comments, ->{ order("id DESC")}

	has_many :likes, :dependent => :destroy
	has_many :liked_users, :through => :likes, :source => :user


	protected

	def check_title
		if self.title.blank?
			self.title = "default title"
		end
	end




end
