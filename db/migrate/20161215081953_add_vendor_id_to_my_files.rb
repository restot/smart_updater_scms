class AddVendorIdToMyFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :my_files, :vendor_id, :string
  end
end
