class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.string :name
      t.string :cake_type
      t.float :price
      t.text :description
      t.integer :quantity
      t.boolean :available

      t.references :order

      t.timestamps null: false
    end
  end
end
