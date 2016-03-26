require 'rails_helper'

RSpec.describe "routing to sign up", :type => :routing do
  it "routes /sign up to users#new" do
    expect(:get => "/users/new").to route_to(
      :controller => "users",
      :action => "new")
  end

  it "routes /Log In to sessions#new" do
    expect(:get => "/sessions/new").to route_to(
      :controller => "sessions",
      :action => "new")
  end
end