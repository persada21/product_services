class ProductActivateJob < ApplicationJob
  queue_as :default

  def perform(product_id)
    product = Product.find_by(id: product_id)
    if product
      product.update(is_active: true)
      ProductMailer.activation_email(product).deliver_now
    end
  end
end
