class CreateEventWorkTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :event_work_types do |t|
      t.references :event, foreign_key: true
      t.references :work_type, foreign_key: true

      t.timestamps
    end
  end
end
