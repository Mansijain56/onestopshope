class CartItemsController < ApplicationController
    before_action :authenticate_user!
    before_action :cart_variable, only: %i[ edit update destroy increment decrement]
    include View

    def index
        @product = Product.find(params[:id])
        @cart_items = current_user.cart.cart_items
        create_view(@product, "view cart button")
    end

    def new
        @cart_item = CartItem.new
    end 

    def register
        @product = Product.find(params[:id])
        @cart_items = CartItem.all
        @cart_item = current_user.cart.cart_items.create(product_id: params[:id])
        respond_to do |format|
            if @cart_item.save
                format.js
            else 
                redirect_to :back , notice: "item is not added to cart"
            end
        end
        create_view(@product, "view cart button")
    end

    def edit
    end

    def update
        @cart_item.update()
        respond_to do |format|
            if @cart_item.update
                format.js
            else 
                redirect_to :back , notice: "item is not added to cart"
            end
        end
    end

    def destroy
        respond_to do |format|
            if @cart_item.delete
                format.js
            else
                redirect_to :back , notice: "item is not added to cart"
            end
        end  
    end

    def increment
        respond_to do |format|
            if @cart_item.update(quantity: @cart_item.quantity + 1)
                format.js
            else
                format.html
            end
        end
    end

    def decrement
        respond_to do |format|
            if @cart_item.update(quantity: @cart_item.quantity - 1)
                format.js
            else
                format.html 
            end
        end
    end

    private

    def cart_variable
        @cart_item = CartItem.find(params[:id])
    end

end
