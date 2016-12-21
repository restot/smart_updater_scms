class AddColsToVendor5s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor5s, :skip_cols, :string
    add_column :vendor5s, :text, :string
    add_column :vendor5s, :skip_rows, :text
  end
end
