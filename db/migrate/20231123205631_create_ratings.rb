class CreateRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :ratings do |t|
        t.integer :user_id, null: false
        t.integer :collection_id, null: false
        t.integer :rating, null: false

        t.timestamps
        end

        add_index :ratings, :user_id
        add_index :ratings, :collection_id

        add_foreign_key :ratings, :users, column: :user_id, on_delete: :cascade
        add_foreign_key :ratings, :collections, column: :collection_id, on_delete: :cascade
      end
    end
