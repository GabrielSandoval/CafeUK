class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      
      t.string :name
      t.string :size
      t.float :small_price
      t.float :medium_price
      t.float :large_price
      t.string :drink_type
      t.text :description
      t.integer :quantity
      t.boolean :available

      t.references :order
      
      t.timestamps null: false
    end
  end
end
