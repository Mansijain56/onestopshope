module OrdersHelper
    def calculate
        price = 0
        @cart_items  = current_user.cart.cart_items
        @cart_items.each do |item|
            total_price = item.quantity * item.product.price
            price += total_price
        end
        price
    end
end
