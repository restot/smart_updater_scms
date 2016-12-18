class AddColToVendor10 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor10s, :visible, :bool, default: true
  end
end
