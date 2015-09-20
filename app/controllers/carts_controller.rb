class CartsController < ApplicationController
	before_filter :initialize_cart

	def show
		redirect_to "menus/index"
	end

	def create
		product_id = params[:product_id]

		@product = Product.find(product_id)
		
		@item = @cart.add(@product)
		flash[:cart_notice] = "Added #{@product.name}"
		redirect_to :menus
	end

end
