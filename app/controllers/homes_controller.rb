class HomesController < ApplicationController
  def index
    @product = Product.all
  end
end
