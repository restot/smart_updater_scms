class AddColToVendor1s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor1s, :visible, :bool, default: true
  end
end
