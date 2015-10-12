module ApplicationHelper

	def admin?
		!(current_user == nil) && current_user.admin
	end
	
	def add_product_link(product)
		link_to '+', add_item_path(:product_id => product), :remote=>true, :method=>"POST", :class=>"btn btn-success"
	end

	def remove_product_link(item)
		link_to "-", remove_item_path(:id=>item), :class=>"btn btn-warning", :remote=>true, :method=>"POST"
	end

	def clear_cart_link
		link_to "Clear cart", clear_cart_path, :class=>"btn btn-danger", :data=>{:confirm=>"Are you sure?"}, :remote=>true
	end

	def delete_order_link(cart)
		link_to "Delete", delete_order_path(:id=>cart), :class=>"button btn btn-danger btn-xs", :method=>:delete, :data=>{:confirm=>"Are you sure?"}
	end

end