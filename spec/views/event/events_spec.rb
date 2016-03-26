require 'rails_helper'

RSpec.describe "events/new", :type => :view do
  context "expect view to have" do
    it " Create Event HeadLine" do
      assign(:event , Event.new)
      render
      expect(rendered).to include("Create Event")
    end
  end
end

RSpec.describe "users/new", :type => :view do
  context "expect view to have" do
    it "Sign Up HeadLine" do
      assign(:user , User.new)
      render
      expect(rendered).to include("Sign Up")
    end
  end
end