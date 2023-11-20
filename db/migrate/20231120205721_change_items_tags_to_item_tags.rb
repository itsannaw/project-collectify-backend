class ChangeItemsTagsToItemTags < ActiveRecord::Migration[7.1]
  def change
    rename_table :items_tags, :item_tags
  end
end
