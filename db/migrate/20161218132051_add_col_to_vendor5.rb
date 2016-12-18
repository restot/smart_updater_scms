class AddColToVendor5 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor5s, :visible, :bool, default: true
  end
end
