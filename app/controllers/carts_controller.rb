class CartsController < ApplicationController
    before_action :authenticate_user!
    def show
        @cart = Cart.find(params[:id])
    end

    def destroy
         @cart = Cart.find(params[:id])
         if @cart.destroy
            redirect_to products_url
         end
    end
end
