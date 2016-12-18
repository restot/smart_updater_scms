class AddColToVendor2 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor2s, :visible, :bool, default: true
  end
end
