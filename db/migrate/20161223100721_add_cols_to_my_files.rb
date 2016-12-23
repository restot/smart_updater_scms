class AddColsToMyFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :my_files, :skip_rows, :text
    add_column :my_files, :skip_cols, :text
  end
end
