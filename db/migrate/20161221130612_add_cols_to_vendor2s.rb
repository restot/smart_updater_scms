class AddColsToVendor2s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor2s, :skip_cols, :text
    add_column :vendor2s, :skip_rows, :text
  end
end
