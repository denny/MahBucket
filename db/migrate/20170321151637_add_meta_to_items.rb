class AddMetaToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :file_meta, :text
  end
end
