class AddColToVendor3 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor3s, :visible, :bool, default: true
  end
end
