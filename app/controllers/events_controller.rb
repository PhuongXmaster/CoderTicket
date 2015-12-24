class EventsController < ApplicationController
  def index
    @events = Event.all.where('ends_at >= ?', DateTime.current)
  end

  def show
    @event = Event.find(params[:id])
  end
end
