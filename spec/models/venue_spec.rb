require 'rails_helper'

RSpec.describe Venue, type: :model do
  context "validation" do
  	it "checks for the uniqueness of name" do
  		venue1 = Venue.new(name: "Nguyen Van Linh")
  		venue2 = Venue.new(name: "Nguyen Van Linh")

  		venue1.save
  		venue2.save

  		expect(venue2.errors).to_not be_empty
  	end
  end
end
