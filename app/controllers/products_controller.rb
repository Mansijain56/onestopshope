class ProductsController < ApplicationController
  require 'csv'
  include View
  before_action :authenticate_user!, except: %i[index show]
  before_action :product_variable, only: %i[show edit update destroy] 
  
  def all_cart_items
  end
  
  def index
    category = params[:category]
    if category.present?
      @products = Product.where(category: category )
    else
      @products = Product.all
    end
  end
  
  def show
    create_view(@product, "product show page")
  end

  def new
    @product = Product.new
  end

  def create
    if @product = current_user.products.create(product_params)
      redirect_to product_url(@product), notice: "Your Product has been created."
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_url(@product)
    end
  end

  def destroy
    if @product.destroy
      redirect_to products_url
    end
  end

  def csv
      @product = current_user.products
      respond_to do |format|
          format.csv do
            send_data Product.to_csv(@product), filename: current_user.email, content_type: "text/csv"
          end
      end
  end
  private

  def product_params
    params.require(:product).permit(:brand, :model, :price, :category, :sub_category, images: [])
  end

  def product_variable
    @product = Product.find(params[:id])
  end

end
