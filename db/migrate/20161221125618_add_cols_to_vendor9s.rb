class AddColsToVendor9s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor9s, :skip_cols, :string
    add_column :vendor9s, :text, :string
    add_column :vendor9s, :skip_rows, :text
  end
end
