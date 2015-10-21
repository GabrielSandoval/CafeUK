class ProductsController < ApplicationController

  def index
    @drinks = Product.find_by_classification("Drink")
    @cakes = Product.find_by_classification("Cake")
    @paninis = Product.find_by_classification("Panini")
    @salads = Product.find_by_classification("Salad")
    @pastas = Product.find_by_classification("Pasta")
  end

  def show

    if can_administer?
      @product = Product.find(params[:id])
    else
      redirect_to :root, :notice=>"Unauthorized access to page"
    end

  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save!
    redirect_to products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if product.update_attributes(product_params)
      product.save
      redirect_to products_path, :notice => 'The product has successfully been updated.'
    else
      redirect_to :back, :alert => 'There was an error updating the product.'
    end   
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to products_path, :notice => 'Product has been deleted.'
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :classification, :default_price, :small_price, :medium_price, :large_price)
    end
end
