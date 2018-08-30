class OrderMailer < ApplicationMailer
  default from: 'bougaut.lea@gmail.com'

  def order_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your picture from Kitten shop')
  end

end
