class AddColsToVendor3s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor3s, :skip_cols, :string
    add_column :vendor3s, :text, :string
    add_column :vendor3s, :skip_rows, :text
  end
end
