class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :cart_id
      t.string :name
      t.string :classification
      t.integer :quantity
      t.text :description
      t.float :price, :precision=>2

      t.timestamps null: false
    end
  end
end
