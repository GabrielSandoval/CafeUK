class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @drinks = Drink.all
    @cakes = Cake.all
    @paninis = Panini.all
    @salads = Salad.all
  end
  
  def show
  	@order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @drinks = Drink.all
    @cakes = Cake.all
    @paninis = Panini.all
    @salads = Salad.all
  end

  def edit
  	@order = Order.find(params[:id])
  end

  def create
  	Order.create(order_params)
  	redirect_to orders_path
  end

  def update
    order = Order.find(params[:id])
    if order.update_attributes(order_params)
      redirect_to orders_path, :notice => 'Your order has successfully been updated.'
    else
      redirect_to :back, :alert => 'There was an error updating your order.'
    end   
  end

  def destroy
    Order.destroy(params[:id])
    redirect_to orders_path, :notice => 'Order has been successfully deleted.'
  end

  private

  def order_params
  	params.require(:order).permit(:order)
  end

end
