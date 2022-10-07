class CarsController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	  def index
	    @cars = Car.all
	  end

	  def show
	    @car = Car.find(params[:id])
	    @like = @car.likes.last
	  end

	  def new
	    @car = Car.new
	    @car.reviews.build
	  end

	  def create
	    @car = current_user.cars.create(car_params)
	    if @car.save
	      redirect_to homes_index_path
	    else
	      render :new
	    end
	  end

	  def edit
	  	@car = Car.find(params[:id])
	  end

	  def update
	    @car = Car.find(params[:id])
	    if @car.update(car_params)
	      redirect_to @car
	    else
	      render :new
	    end
	  end

	  def destroy
	    @car = Car.find(params[:id])
	    @car.destroy

	    redirect_to root_path
	  end

	  private
	  def car_params
	    params.require(:car).permit(:brand, :model, :price, :manufacturing_year, vatient:[], images:[],reviews_attributes: [:car_id,:review])
	  end
end



