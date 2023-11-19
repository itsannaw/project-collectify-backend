# frozen_string_literal: true

class CreateItemsAndTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end

    create_table :items do |t|
      t.integer :title
      t.integer :tag_id
      t.integer :user_id
      t.integer :collection_id
      t.string :custom_string1
      t.string :custom_string2
      t.string :custom_string3
      t.text :custom_text1
      t.text :custom_text2
      t.text :custom_text3
      t.integer :custom_int1
      t.integer :custom_int2
      t.integer :custom_int3
      t.boolean :custom_bool1
      t.boolean :custom_bool2
      t.boolean :custom_bool3
      t.date :custom_date1
      t.date :custom_date2
      t.date :custom_date3

      t.timestamps
    end

    add_foreign_key :items, :tags, column: :tag_id
    add_foreign_key :items, :users, column: :user_id
    add_foreign_key :items, :collections, column: :collection_id
  end
end
