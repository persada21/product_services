class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.all
    render json: @products, each_serializer: ProductSerializer
  end

  # GET /products/1
  def show
    render json: @product, serializer: ProductSerializer
  end

  # POST /products
  def create
    product = Product.new(product_params)

    if product.save
      ActionCable.server.broadcast "products_channel", {message: product.as_json}
      ProductActivateJob.set(wait: 3.minutes).perform_later(product.id)
      render json: product, status: :created, serializer: ProductSerializer
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product, serializer: ProductSerializer
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    head :no_content
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :category, :image, :is_active, :user_id)
  end
end
