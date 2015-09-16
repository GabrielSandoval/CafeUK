class CreatePaninis < ActiveRecord::Migration
  def change
    create_table :paninis do |t|
	  t.string :name
      t.float :price
      t.text :description
      t.timestamps null: false
    end
  end
end
