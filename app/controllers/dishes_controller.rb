class DishesController < ApplicationController
  before_action :authenticate_user!

  def create
    @dish = Dish.new(dish_params)
    @dish.user = current_user

    if @dish.save
      render json: {dish: @dish.title, text: "the new dish has been successfully created"}, status: :created
    else
      render json: @dish.errors.full_messages, status: :bad_request
    end
  end

  def show
    @dish = Dish.find(params[:id])
    @energy_value = EnergyValueService.new(@dish)
    @energy_value.calculate
  end

  private

  def dish_params
    params.require(:dish).permit(:title, :number_of_servings, dish_ingredients_attributes: [:product_id, :weight, :_destroy] )
  end

end
