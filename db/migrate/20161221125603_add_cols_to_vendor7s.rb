class AddColsToVendor7s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor7s, :skip_cols, :string
    add_column :vendor7s, :text, :string
    add_column :vendor7s, :skip_rows, :text
  end
end
