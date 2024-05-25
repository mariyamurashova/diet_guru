class ProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { text: "the new product has been successfully created"}, status: :created
    else
      render json: @product.errors.full_messages, status: :bad_request
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :brand_name, :calorie, 
                                    :protein, :fat, :carbohydrate)
  end
end
