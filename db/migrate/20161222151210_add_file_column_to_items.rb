class AddFileColumnToItems < ActiveRecord::Migration[5.0]
  def up
    add_attachment :items, :file
  end

  def down
    remove_attachment :items, :file
  end
end
