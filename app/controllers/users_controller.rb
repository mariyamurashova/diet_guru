class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @dish = Dish.new
    @product = Product.new
    @dishes = current_user.dishes
  end

  def update
    current_user.image.attach(params[:user][:image]) if params[:user][:image].present? 
    current_user.update(user_params)
  end

  private

  def user_params
     params.require(:user).permit(:image, :first_name, :last_name, :date_of_birth, :current_weight, :target_weight)                            
  end
end
