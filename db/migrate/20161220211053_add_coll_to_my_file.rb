class AddCollToMyFile < ActiveRecord::Migration[5.0]
  def change
    add_column :my_files, :main, :bool, default: false
  end
end
