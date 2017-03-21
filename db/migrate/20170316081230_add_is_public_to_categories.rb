class AddIsPublicToCategories < ActiveRecord::Migration[5.0]
  def change
  	add_column :categories, :is_public, :boolean
  end
end
