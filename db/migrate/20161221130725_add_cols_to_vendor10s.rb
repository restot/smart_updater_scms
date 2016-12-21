class AddColsToVendor10s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor10s, :skip_cols, :text
    add_column :vendor10s, :skip_rows, :text
  end
end
