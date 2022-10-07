class LikesController < ApplicationController
   def create
   	@car = Car.find_by(id: params[:car_id])
  		@like = @car.likes.create
				if @like.save
  				redirect_to cars_path
  			end
  	end

  	def dislike
		@car = Car.find_by(id: params[:car_id])
    	@like = @car.likes.find_by(id: params[:id])
    	@like.destroy
    		redirect_to cars_path
	end
end

