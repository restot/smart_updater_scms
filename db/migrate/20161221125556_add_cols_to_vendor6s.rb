class AddColsToVendor6s < ActiveRecord::Migration[5.0]
  def change
    add_column :vendor6s, :skip_cols, :string
    add_column :vendor6s, :text, :string
    add_column :vendor6s, :skip_rows, :text
  end
end
