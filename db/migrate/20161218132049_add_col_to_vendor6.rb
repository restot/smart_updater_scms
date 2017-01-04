class AddColToVendor6 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor6s, :visible, :bool, default: true
  end
end
