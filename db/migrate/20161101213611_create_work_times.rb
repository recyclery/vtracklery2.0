class CreateWorkTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :work_times do |t|
      t.references :worker, foreign_key: true
      t.references :event, foreign_key: true
      t.references :work_type, foreign_key: true
      t.datetime :work_start
      t.datetime :work_end

      t.timestamps
    end
  end
end
