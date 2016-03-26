require 'rails_helper'

RSpec.describe Event, type: :model do
	before do
		@venue = dalat = Venue.create({
			  name: 'Da Lat City',
			  full_address: 'Ngoc Phat Hotel 10 Hồ Tùng Mậu Phường 3, Thành phố Đà Lạt, Lâm Đồng, Thành Phố Đà Lạt, Lâm Đồng',
			  region: Region.find_by(name: 'Lam Dong')
			})
  		@category = Category.new(name: "whatever")
	end

  context "validations" do
  	it "starts_at cannot be later ends_at" do
  		event = Event.new(name: "e1", extended_html_description: "das",
  			starts_at: DateTime.parse('Mon, 14 Mar 2016 7:00 AM+0700'),
  			ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
  			venue: @venue, category: @category
  		)

  		event.save
  		expect(event.errors).to_not be_empty
  	end

  	it "name must be presence" do
  		event = Event.new(extended_html_description: "das",
  			starts_at: DateTime.parse('Mon, 14 Mar 2016 7:00 AM+0700'),
  			ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
  			venue: @venue, category: @category
  		)
  		event.save
  		expect(event.errors).to_not be_empty
  	end

  	it "extended_html_description must be presence" do
  		event = Event.new(name: "das",
  			starts_at: DateTime.parse('Mon, 14 Mar 2016 7:00 AM+0700'),
  			ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
  			venue: @venue, category: @category
  		)
  		event.save
  		expect(event.errors).to_not be_empty
  	end
  	it "venue must be presence" do
  		event = Event.new(name: "adasd", extended_html_description: "das",
  			starts_at: DateTime.parse('Mon, 14 Mar 2016 7:00 AM+0700'),
  			ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
  			category: @category
  		)
  		event.save
  		expect(event.errors).to_not be_empty
  	end
  	it "category must be presence" do
  		event = Event.new(name: "dasdas", extended_html_description: "das",
  			starts_at: DateTime.parse('Mon, 14 Mar 2016 7:00 AM+0700'),
  			ends_at: DateTime.parse('Sun, 13 Mar 2016 3:00 PM+0700'),
  			venue: @venue
  		)
  		event.save
  		expect(event.errors).to_not be_empty
  	end
  end
end
