class AddColToVendor9 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor9s, :visible, :bool, default: true
  end
end
