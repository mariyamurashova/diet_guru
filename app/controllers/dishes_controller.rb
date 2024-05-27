class DishesController < ApplicationController
  before_action :authenticate_user!

  def create
    byebug
    @dish = Dish.create(dish_params)
    @dish.dish_ingredients.create(params_dish_ingredients)
    if @dish.save
      render json: { text: "the new dish has been successfully created"}, status: :created
    else
      render json: @dish.errors.full_messages, status: :bad_request
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:title, :number_of_servings)
  end

  def params_dish_ingredients
     params.require(:dish_ingredients).permit(:id, :product, :weight, :_destroy)
  end
end
