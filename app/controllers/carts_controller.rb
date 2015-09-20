class CartsController < ApplicationController
	before_filter :initialize_cart

	def create
		product_id = params[:product_id]
		@product = Product.find(product_id)

		if request.xhr?
			@item = @cart.add(@product)
			flash[:cart_notice] = "Added #{@product.name}"
			render :action => "add_with_ajax"
		elsif request.post?
			@item = @cart.add(@product)
			flash[:cart_notice] = "Added #{@product.name}"
			redirect_to session[:return_to] || {:controller => "menus"}
		else
			render
		end
		# product_id = params[:product_id]
		# @product = Product.find(product_id)
		# @item = @cart.add(@product)
		# flash[:cart_notice] = "Added #{@product.name}"
		# redirect_to :menus
	end

	def remove
		
		if request.xhr?
			@cart = session[:cart_id]
			@item = @cart.remove(params[:id])
			flash.now[:cart_notice] = "Removed 1 #{@item.name}"
			render :action => "remove_with_ajax"
		elsif request.post?
			@item = @cart.remove(params[:id])
			flash[:cart_notice] = "Removed 1 #{@item.name}"
			redirect_to :controller => "menus"
		else
		render
		end
	end

end
