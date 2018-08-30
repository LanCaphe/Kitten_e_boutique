class OrderMailer < ApplicationMailer
  default from: 'lariskau@hotmail.fr'

  def order_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Your picture from Kitten shop')
  end

end
