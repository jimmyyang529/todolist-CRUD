class AddIsPublicToItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :items, :is_public, :boolean
  	add_column :items, :status, :string
  end
end
