module EventsHelper
  def header_background_image_url
    "https://az810058.vo.msecnd.net/site/global/Content/img/home-search-bg-0#{rand(6)}.jpg"
  end

  def has_ticket_type?(event_id)
  	ticket_types = TicketType.all
  	ticket_types.each do |ticket_type|
  		if ticket_type.event_id == event_id
  			return true
  		end
  	end
  	return false
  end

end
