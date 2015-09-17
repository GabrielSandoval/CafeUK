class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :table_number
      t.integer :number_of_people
      t.datetime :date
      t.datetime :time
      t.boolean :finished

      t.references :user

      t.timestamps null: false
    end
  end
end
