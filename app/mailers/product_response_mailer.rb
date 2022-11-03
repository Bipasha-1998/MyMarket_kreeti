class ProductResponseMailer < ApplicationMailer
  def response(product)
    @url = 'http://localhost:3000/products'
    @seller = User.find(product.user_id)
    @user = params[:user]
    mail(to: @seller.email, subject: 'You have a response to your <%= product.title %> Ad')
  end
end
