class AddFingerprintToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :file_fingerprint, :string
  end
end
