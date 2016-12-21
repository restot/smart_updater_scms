class AddColsToVendor3s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor3s, :skip_cols, :text
    add_column :vendor3s, :skip_rows, :text
  end
end
