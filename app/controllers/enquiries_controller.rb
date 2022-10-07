class EnquiriesController < ApplicationController
	before_action :authenticate_user! 
	def index
		@enquiries = Enquiry.all
	end
	def new
		@enquiry = Enquiry.new
	end
	def show 
		@enquiry = Enquiry.find(params[:id])
	end
	def create
		@enquiry = current_user.enquiries.create(enquiry_params)
		if @enquiry.save
			redirect_to cars_path
		else
			render :new
		end
	end 
	private
	def enquiry_params
		params.require(:enquiry).permit(:mobile)
	end
end
