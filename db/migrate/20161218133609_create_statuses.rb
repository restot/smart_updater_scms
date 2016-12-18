class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.string :model_id
      t.string :status
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
