class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.boolean :finalized, :default=>false
      t.references :user
      t.timestamps null: false
    end
  end
end
