class TicketTypesController < ApplicationController
	def new
		@ticket_type = TicketType.new
	end

	def create
		@ticket_type = TicketType.new ticket_type_params
      if @ticket_type.save
        flash[:success] = "Create ticket type Successfully"
        redirect_to root_path
      else
        flash.now[:error] = "Error: #{@ticket_type.errors.full_messages.to_sentence}"
        render 'new'
      end
	end

	def ticket_type_params
    params.require(:ticket_type).permit(:name, :price, :max_quantity, :event_id)
  end

end

