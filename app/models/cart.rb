class Cart < ActiveRecord::Base

	has_many :cart_items
	belongs_to :user, :foreign_key => :user_id
	
	def total
		sum = 0

		cart_items.each do |item|
			sum = sum + (item.price * item.quantity)
		end

		sum
	end

	def add(product)

		if !(find_in_cart(product.id) == nil)
			ci = find_in_cart(product.id)
			ci.update_attribute(:quantity, ci.quantity + 1)
		else
			if product.classification == "drink"
				ci = cart_items.create(:product_id => product.id, :name => product.name, :quantity => 1, :classification => product.classification, :price => product.default_price)
			else
				ci = cart_items.create(:product_id => product.id, :name => product.name, :quantity => 1, :classification => product.classification, :price => product.default_price)
			end
		end
		ci
	end

	def find_in_cart(product_id)
		cart_items.each do |item|
			if item.product_id == product_id
				return item
			end
		end
		nil
	end

	def remove(cart_item_id)
		ci = CartItem.find(cart_item_id)
		if ci.quantity > 1
			ci.update_attribute(:quantity, ci.quantity - 1)
		else
			CartItem.destroy(ci.id)
		end
		return ci
	end	

end
