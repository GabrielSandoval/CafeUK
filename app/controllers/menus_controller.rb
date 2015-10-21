class MenusController < ApplicationController
  before_action :authenticate_user!
  before_filter :initialize_cart

  def index
    @drinks = Product.find_by_classification("Drink")
    @cakes = Product.find_by_classification("Cake")
    @paninis = Product.find_by_classification("Panini")
    @salads = Product.find_by_classification("Salad")
    @pastas = Product.find_by_classification("Pasta")
  end

  def show
  	redirect_to :index
  end

end
