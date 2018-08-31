class OrderMailer < ApplicationMailer
  default from: 'lariskau@hotmail.fr'

  def order_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your picture from Kitten shop')
    mail(to: 'admin@lol.com', subject: 'Your shop received a new order')
  end

end
