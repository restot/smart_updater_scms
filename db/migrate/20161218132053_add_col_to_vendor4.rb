class AddColToVendor4 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor4s, :visible, :bool, default: true
  end
end
