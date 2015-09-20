class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :classification
      t.text :description
      t.boolean :available
      t.float :default_price
      t.float :small_price
      t.float :medium_price
      t.float :large_price
      t.timestamps null: false
    end
  end
end
