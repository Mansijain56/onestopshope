class OrderMailer < ApplicationMailer
    def send_mail(order, user)
        @order = order
        @user = user
        mail(to: @user.email, subject: 'You have bought this order')
    end
end
