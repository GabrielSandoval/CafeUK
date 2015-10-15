class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.boolean :finalized, :default=>false
      t.boolean :served, :default=>false
      t.datetime :time_ordered
      t.references :user
      t.timestamps null: false
    end
  end
end
