class MyEventsController < ApplicationController
  def index
  	@events = Event.where(created_by: session[:user_id])
  end
end
