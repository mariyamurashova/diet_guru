class DishesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_dish, only: [:show, :update, :destroy]

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
    call_energy_value_service
  end

  def update
    call_energy_value_service if @dish.update(dish_params)
  end

  def destroy
    if @dish.destroy! 
      redirect_to user_path(current_user)
      flash[:notice] = "The dish was successfully deleted"
    end
  end

  private

  def call_energy_value_service
    @energy_value = EnergyValueService.new(@dish)
    @energy_value.calculate
  end

  def find_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:title, :number_of_servings, dish_ingredients_attributes: [:id, :product_id, :weight, :_destroy] )
  end

end
