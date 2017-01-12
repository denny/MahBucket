class RemoveUnusedFilenameColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :filename
  end
end
