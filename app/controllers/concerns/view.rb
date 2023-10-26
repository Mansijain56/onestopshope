module View
    extend ActiveSupport::Concern

    included do 
        def create_view(product, event)
            @view = ViewCount.where(user_id: current_user.id, product_id: product.id, event: event)
            if @view.present?
                @view.update(count: @view.first.count + 1 )
            else
                current_user.view_counts.create(product: product, count: 1, event: event)
            end
        end
    end
end