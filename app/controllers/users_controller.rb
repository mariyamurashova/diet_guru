class UsersController < ApplicationController

  def index
  end

  def show
  end

  def update
    current_user.update(user_params)
      respond_to do |format| 
        format.turbo_stream 
    # format.json  {render json: { text: "your persanal information was succesfully updated", partial: 'users/user'} }
      end
    #else
     # render json: current_user.errors.full_messages, status: :unprocesseble_intinity
    #end
  end

  private

  def user_params
     params.require(:user).permit(:first_name, :last_name, :date_of_birth, :current_weight, :target_weight)                            
  end
end
