module HomesHelper
    def filter_home
        @home_query = Product.where(category: "Home")
    end

    def filter_mobile
        @home_query = Product.where(category: "Mobile")
    end

    def filter_kitchen
        @home_query = Product.where(category: "Kitchen")
    end
end
