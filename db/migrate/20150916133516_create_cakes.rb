class CreateCakes < ActiveRecord::Migration
  def change
    create_table :cakes do |t|
      t.string :name
      t.string :type
      t.float :price
      t.text :description

      t.timestamps null: false
    end
  end
end
