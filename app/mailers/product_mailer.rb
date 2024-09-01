class ProductMailer < ApplicationMailer
  default from: "ersad40@gmail.com" # Replace with your preferred sender email

  def activation_email(product)
    @product = product
    @user = @product.user

    mail(to: @user.email, subject: "Your Product is Now Active!")
  end
end
