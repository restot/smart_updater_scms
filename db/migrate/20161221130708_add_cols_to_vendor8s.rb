class AddColsToVendor8s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor8s, :skip_cols, :text
    add_column :vendor8s, :skip_rows, :text
  end
end