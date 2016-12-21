class AddCollToMyFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :my_files, :main_template, :text
  end
end
