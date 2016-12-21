class AddColsToVendor8s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor8s, :skip_cols, :string
    add_column :vendor8s, :text, :string
    add_column :vendor8s, :skip_rows, :text
  end
end
