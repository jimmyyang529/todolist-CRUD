class Tag < ApplicationRecord
	has_many :tag_itemships
	has_many :items, :through => :tag_itemships
	
end
