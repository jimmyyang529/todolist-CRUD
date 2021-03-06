class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :items
   has_many :comments

   has_many :likes, :dependent => :destroy
   has_many :liked_items, :through => :likes, :source => :item

   def short_name
   	self.email.split("@").first
   end
end
