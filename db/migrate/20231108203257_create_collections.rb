class CreateCollections < ActiveRecord::Migration[7.1]
  def change
    create_table :collections do |t|
      t.string :title
      t.text :desc
      t.string :image_url
      t.integer :category_id
      t.integer :user_id
      t.string :custom_string1_name
      t.boolean :custom_string1_enabled
      t.string :custom_string2_name
      t.boolean :custom_string2_enabled
      t.string :custom_string3_name
      t.boolean :custom_string3_enabled
      t.string :custom_text1_name
      t.boolean :custom_text1_enabled
      t.string :custom_text2_name
      t.boolean :custom_text2_enabled
      t.string :custom_text3_name
      t.boolean :custom_text3_enabled
      t.string :custom_int1_name
      t.boolean :custom_int1_enabled
      t.string :custom_int2_name
      t.boolean :custom_int2_enabled
      t.string :custom_int3_name
      t.boolean :custom_int3_enabled
      t.string :custom_bool1_name
      t.boolean :custom_bool1_enabled
      t.string :custom_bool2_name
      t.boolean :custom_bool2_enabled
      t.string :custom_bool3_name
      t.boolean :custom_bool3_enabled
      t.string :custom_date1_name
      t.boolean :custom_date1_enabled
      t.string :custom_date2_name
      t.boolean :custom_date2_enabled
      t.string :custom_date3_name
      t.boolean :custom_date3_enabled
      t.timestamps
    end

    add_foreign_key :collections, :categories, column: :category_id
    add_foreign_key :collections, :users, column: :user_id
  end
end
