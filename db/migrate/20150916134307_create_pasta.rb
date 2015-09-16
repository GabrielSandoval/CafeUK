class CreatePasta < ActiveRecord::Migration
  def change
    create_table :pasta do |t|
      t.string :name
      t.float :price
      t.text :description
      t.boolean :available
      
      t.timestamps null: false
    end
  end
end
