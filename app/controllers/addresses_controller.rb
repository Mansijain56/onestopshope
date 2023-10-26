class AddressesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_variable, only: %i[edit destroy update]
    def new
        @address = Address.new
    end

    def create
        @address = current_user.addresses.create(address_params)
        respond_to do |format|
            if @address.save
                format.js
            end
        end
    end

    def edit
    end

    def update
        if @address.update(address_params)
            respond_to do |format|
                format.js
            end
        end
    end

    def destroy
        if @address.destroy
            respond_to do |format|
                format.js
            end
        end
    end

    private

    def address_params
        params.require(:address).permit(:full_name, :mobile_number, :pincode, :house_no, :area, :landmark, :city, :state, :address_type)
    end

    def set_variable
        @address = Address.find(params[:id])
    end

end
