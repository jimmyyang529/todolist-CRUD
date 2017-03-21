class CreateTagItemships < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_itemships do |t|
      t.integer :tag_id
      t.integer :item_id

      t.timestamps
    end

    add_index :tag_itemships, :tag_id
    add_index :tag_itemships, :item_id
  end
end
