class AddColToVendor7 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor7s, :visible, :bool, default: true
  end
end
