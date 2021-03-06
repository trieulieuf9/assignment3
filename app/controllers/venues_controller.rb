class VenuesController < ApplicationController
	def new
		@venue = Venue.new
	end

	def create
		@venue = Venue.new venue_params
      if @venue.save
        flash[:success] = "Create ticket type Successfully"
        redirect_to root_path
      else
        flash.now[:error] = "Error: #{@venue.errors.full_messages.to_sentence}"
        render 'new'
      end
	end

	def venue_params
    	params.require(:venue).permit(:name, :full_address, :region_id)
  	end
end