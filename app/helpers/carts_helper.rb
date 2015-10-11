module CartsHelper

	def display_cart_owner(cart)
	"#{User.find(cart.user).first_name} #{User.find(cart.user).last_name}"
	end
end
