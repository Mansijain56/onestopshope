class VouchersController < ApplicationController
    def show
        @voucher = current_user.voucher
    end
end
