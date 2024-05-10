class ImagesController < ApplicationController
  
  def destroy 
    current_user.image.purge 
  end
end
