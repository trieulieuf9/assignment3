class EventsController < ApplicationController
  def index
  	if params[:search]
		@search_events = Event.where("name LIKE ?", "%#{params[:search]}%").where(["starts_at > ?", Time.now])
	else   
    	@events = Event.where(["starts_at > ?", Time.now])
    end
    @ticket_type = TicketType.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    if(params[:published])
      @event = Event.find_by_id(params[:event_id])
      @event.published = true
      @event.save
      redirect_to root_path
    else
      @event = Event.new event_params
      @event.starts_at = DateTime.parse('Sun, 17 Jun 2016, 8:00 PM+0700')
      @event.ends_at = DateTime.parse('Sun, 17 Jun 2016, 9:00 PM+0700')
      if @event.save
        flash[:success] = "Create Event Successfully"
        redirect_to root_path
      else
        flash.now[:error] = "Error: #{@event.errors.full_messages.to_sentence}"
        render 'new'
      end
    end
  end


  def event_params
    params.require(:event).permit(:starts_at, :ends_at, :venue_id, :hero_image_url, 
      :extended_html_description, :category_id, :name)
  end

end
