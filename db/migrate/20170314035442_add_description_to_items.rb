class AddDescriptionToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :decription, :text
  end
end
