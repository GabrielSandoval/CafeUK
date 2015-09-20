class ProductsController < ApplicationController

  def index
    @drinks = Product.find_by_classification(:drink)
    @cakes = Product.find_by_classification(:cake)
    @paninis = Product.find_by_classification(:panini)
    @salads = Product.find_by_classification(:salad)
    @pastas = Product.find_by_classification(:pasta)
  end

end
