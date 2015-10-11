class CartsController < ApplicationController
	before_filter :initialize_cart
	respond_to :html, :js
	
	def index
		@carts = Cart.all
	end

	def show
	end

	def add
		product_id = params[:product_id]
		@product = Product.find(product_id)

		if request.xhr?
			@item = @cart.add(@product)
			flash[:cart_notice] = "Added 1 #{@product.name}"
			render :action => "refresh_shopping_cart"
		elsif request.post?
			@item = @cart.add(@product)
			flash[:cart_notice] = "Added 1 #{@product.name}"
			redirect_to session[:return_to] || {:controller => "menus"}
		else
			render
		end
	end

	def remove
		if request.xhr?
			@item = @cart.remove(params[:id])
			flash.now[:cart_notice] = "Removed 1 #{@item.name}"
			render :action => "refresh_shopping_cart"
		elsif request.post?
			@item = @cart.remove(params[:id])
			flash[:cart_notice] = "Removed 1 #{@item.name}"
			redirect_to :controller => "menus"
		else
		render
		end
	end

	def clear
		if request.xhr?
			@cart.cart_items.destroy_all
			flash.now[:cart_notice] = "Cleared the cart"
			render :action => "refresh_shopping_cart"
		elsif request.post?
			@cart.cart_items.destroy_all
			flash[:cart_notice] = "Cleared the cart"
			redirect_to :controller => "menus"
		else
			@cart.cart_items.destroy_all
			redirect_to :controller => "menus"
		end
	end

  def destroy
    Cart.destroy(params[:id])
    redirect_to carts_path, :notice => 'Order has been deleted.'
  end

end
