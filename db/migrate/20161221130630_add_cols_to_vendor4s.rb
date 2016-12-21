class AddColsToVendor4s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor4s, :skip_cols, :text
    add_column :vendor4s, :skip_rows, :text
  end
end
