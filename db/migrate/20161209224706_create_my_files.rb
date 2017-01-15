class CreateMyFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :my_files do |t|
      t.string :name
      t.string :attachment
      t.boolean :main, default: false
      t.text :main_template
      t.text :skip_rows
      t.text :skip_cols
      t.string :vendor_id
      t.timestamps
    end
  end
end
