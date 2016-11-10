class CreateWorkerSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :worker_skills do |t|
      t.integer :proficiency
      t.references :worker, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
