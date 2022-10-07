class RatingsController < ApplicationController
	before_action :authenticate_user!
	  def index
	    @ratings = Rating.all
	  end

	  def show
	    @rating = Rating.find(params[:id])
	   end

	  def new
	    @rating = Rating.new
	   end

	  def create
	    @rating = Rating.create(rating_params)
	    if @rating.save
	      redirect_to root_path
	    else
	      render :new
	    end
	  end

	  private
	  def rating_params
	    params.require(:rating).permit(:description,:car_id)
	  end
end



