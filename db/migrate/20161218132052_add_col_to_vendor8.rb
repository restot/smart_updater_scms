class AddColToVendor8 < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor8s, :visible, :bool, default: true
  end
end
