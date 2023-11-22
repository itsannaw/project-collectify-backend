class AddDefaultValueToCollections < ActiveRecord::Migration[7.1]
  def change
    change_table :collections do |t|
      t.change :custom_bool1_name, :string, :default => ""
      t.change :custom_bool2_name, :string, :default => ""
      t.change :custom_bool3_name, :string, :default => ""
      t.change :custom_string1_name, :string, :default => ""
      t.change :custom_string2_name, :string, :default => ""
      t.change :custom_string3_name, :string, :default => ""
      t.change :custom_text1_name, :string, :default => ""
      t.change :custom_text2_name, :string, :default => ""
      t.change :custom_text3_name, :string, :default => ""
      t.change :custom_date1_name, :string, :default => ""
      t.change :custom_date2_name, :string, :default => ""
      t.change :custom_date3_name, :string, :default => ""
      t.change :custom_int1_name, :string, :default => ""
      t.change :custom_int2_name, :string, :default => ""
      t.change :custom_int3_name, :string, :default => ""

      t.change :custom_bool1_enabled, :boolean, :default => false
      t.change :custom_bool2_enabled, :boolean, :default => false
      t.change :custom_bool3_enabled, :boolean, :default => false
      t.change :custom_string1_enabled, :boolean, :default => false
      t.change :custom_string2_enabled, :boolean, :default => false
      t.change :custom_string3_enabled, :boolean, :default => false
      t.change :custom_text1_enabled, :boolean, :default => false
      t.change :custom_text2_enabled, :boolean, :default => false
      t.change :custom_text3_enabled, :boolean, :default => false
      t.change :custom_date1_enabled, :boolean, :default => false
      t.change :custom_date2_enabled, :boolean, :default => false
      t.change :custom_date3_enabled, :boolean, :default => false
      t.change :custom_int1_enabled, :boolean, :default => false
      t.change :custom_int2_enabled, :boolean, :default => false
      t.change :custom_int3_enabled, :boolean, :default => false
    end
  end
end
