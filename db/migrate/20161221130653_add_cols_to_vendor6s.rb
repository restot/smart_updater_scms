class AddColsToVendor6s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor6s, :skip_cols, :text
    add_column :vendor6s, :skip_rows, :text
  end
end
