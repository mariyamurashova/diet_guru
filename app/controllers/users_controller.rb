class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @product = Product.new
  end

  def update
    current_user.image.attach(params[:user][:image]) if params[:user][:image].present? 
    current_user.update(user_params)
      respond_to do |format| 
        format.html { redirect_to user_path(current_user), notice: "Persanal info was succesfully updated." }
        format.turbo_stream 
      end
  end

  private

  def user_params
     params.require(:user).permit(:image, :first_name, :last_name, :date_of_birth, :current_weight, :target_weight)                            
  end
end
