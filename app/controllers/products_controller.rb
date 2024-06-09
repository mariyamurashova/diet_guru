class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:update]

  def create
    @product = Product.new(product_params)
    if @product.save
      render json: { product: @product.title, text: "the new product has been successfully created"}, status: :created
    else
      render json: @product.errors.full_messages, status: :bad_request
    end
  end

  def update
    @product.update(product_params)
    #  render json:  { text: "the product has been successfully updated"}, status: :created
   # else
    #  render json: @product.errors.full_messages, status: :bad_request
    #end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :brand_name, :calorie, 
                                    :protein, :fat, :carbohydrate)
  end
end
