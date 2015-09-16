class CreatePaninis < ActiveRecord::Migration
  def change
    create_table :paninis do |t|
	  t.string :name
      t.float :price
      t.text :description
      t.boolean :available
      
      t.references :order

      t.timestamps null: false
    end
  end
end
