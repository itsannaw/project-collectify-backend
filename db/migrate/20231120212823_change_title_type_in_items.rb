class ChangeTitleTypeInItems < ActiveRecord::Migration[7.1]
  def change
    change_table :items do |t|
      t.change :title, :string
    end
  end
end
