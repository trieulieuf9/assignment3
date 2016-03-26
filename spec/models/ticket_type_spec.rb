require 'rails_helper'

RSpec.describe TicketType, type: :model do
    context "Validation" do
		it "different ticket type cannot have the same name" do
			ticket_type = TicketType.new(name: "type 1")
			ticket_type1 = TicketType.new(name: "type 2")

			ticket_type.save
			ticket_type1.save

			expect(ticket_type.name).to_not eq ticket_type1.name
		end

		it "ticket type must belong to an event" do
			event = Event.new
			event.save validate: false
			ticket = event.ticket_types.create price: 1
			expect(ticket.event_id).to_not be nil
		end
	end
end
