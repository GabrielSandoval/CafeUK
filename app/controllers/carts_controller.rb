class CartsController < ApplicationController
	before_filter :initialize_cart
	respond_to :html, :js
	
	def index
		if can_administer?
			@carts = Cart.find_orders
		else
			@carts = Cart.joins(:user).where(user: current_user).order('time_ordered DESC')
		end
	
	end

	def show
	end

	def add
		product_id = params[:product_id]
		@product = Product.find(product_id)

		if request.xhr?
			@item = @cart.add(@product)
			flash.now[:cart_notice] = "Added 1 #{@product.name}"
			render :action => "refresh_shopping_cart"
		elsif request.post?
			@item = @cart.add(@product)
			flash.now[:cart_notice] = "Added 1 #{@product.name}"
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

  def update
  	cart = Cart.find(params[:id])

  	if cart.update_attributes(cart_params)
      
      if can_administer?
      	
      	if cart.served
	      	owner = User.find(cart.user)
	  		p = owner.points + cart.total/10
	  		owner.update_attributes(:points => p)
	  	end
      	redirect_to carts_path, :notice => 'Your order has successfully been marked as served.'
      
      else
		if cart.finalized
		cart.update_attributes(:time_ordered => DateTime.now)
		end
		destroy_cart_session
		destroy_unsettled_carts
      	redirect_to page_path(:home), :notice => 'Thank you for ordering! Your food will be served in a while.'
      end

    else
      redirect_to :back, :alert => 'There was an error updating the order.'
    end   
  end

  private
  	def cart_params
  		params.require(:cart).permit(:finalized, :served)
  	end

  	def destroy_unsettled_carts
  		unsettled_carts = Cart.joins(:user).where(user: current_user)

  		unsettled_carts.each do |unsettled_cart|
  			if !unsettled_cart.finalized
  				unsettled_cart.destroy
  			end
  		end
  	end

end
