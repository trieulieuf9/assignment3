module MyEventsHelper
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
