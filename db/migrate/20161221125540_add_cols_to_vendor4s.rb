class AddColsToVendor4s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor4s, :skip_cols, :string
    add_column :vendor4s, :text, :string
    add_column :vendor4s, :skip_rows, :text
  end
end
