class ProfilesController < ApplicationController
	before_action :authenticate_user!
	def index
		@profiles = Profile.all
	end

	def new
		@profile = Profile.new
	end

	def show 
		@profile = Profile.find(params[:id])
	end
    def edit
		@profile = Profile.find(params[:id])
	end
	def update
		@profile = Profile.find(params[:id])
		if @profile.update(profiles_params)
      		redirect_to @profile
    	else
      		render :edit
    	end
	end
	def create
		@user = current_user
		@profile = @user.build_profile(profiles_params)
		if @profile.save
			redirect_to @profile
		else
			render :new
		end
	end 

	private
	def profiles_params
		params.require(:profile).permit(:first_name, :last_name, :gender, :age, :house_no, :street, :city, :state, :country, :pincode)
	end

 end

