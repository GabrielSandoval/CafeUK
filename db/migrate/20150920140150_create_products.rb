class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :classification
      t.text :description
      t.boolean :available
      t.float :default_price, :precision=>2
      t.float :small_price, :precision=>2
      t.float :medium_price, :precision=>2
      t.float :large_price, :precision=>2
      t.timestamps null: false
    end
  end
end
