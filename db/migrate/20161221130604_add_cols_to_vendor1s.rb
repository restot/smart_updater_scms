class AddColsToVendor1s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor1s, :skip_cols, :text
    add_column :vendor1s, :skip_rows, :text
  end
end
