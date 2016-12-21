class AddColsToVendor10s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor10s, :skip_cols, :string
    add_column :vendor10s, :text, :string
    add_column :vendor10s, :skip_rows, :text
  end
end
