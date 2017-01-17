class CreateSecondLists < ActiveRecord::Migration[5.0]
  def change
    create_table :second_lists do |t|
      t.text :col_0
      t.text :col_1
      t.text :col_2
      t.text :col_3
      t.text :col_4
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
