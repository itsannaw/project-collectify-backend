class RemoveTagIdFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :tag_id, :integer
  end
end
