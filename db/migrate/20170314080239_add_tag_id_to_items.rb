class AddTagIdToItems < ActiveRecord::Migration[5.0]
  def change
  	add_column :items, :tag_id, :integer
  end
end
