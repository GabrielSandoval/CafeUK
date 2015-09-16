class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
	  t.float :cash_breakdown
	  t.float :change
      t.float :total_balance
      t.boolean :active
      
      t.timestamps null: false
    end
  end
end
