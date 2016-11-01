class CreateWorkers < ActiveRecord::Migration[5.0]
  def change
    create_table :workers do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.references :user_type

      t.timestamps
    end
  end
end
