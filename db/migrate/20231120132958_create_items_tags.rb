class CreateItemsTags < ActiveRecord::Migration[7.1]
  def change
    create_table :items_tags do |t|
      t.integer :tag_id
      t.integer :item_id
      t.timestamps
    end

    add_foreign_key :items_tags, :tags, column: :tag_id
    add_foreign_key :items_tags, :items, column: :item_id
  end
end
