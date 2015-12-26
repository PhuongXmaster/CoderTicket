class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    search_term = params[:search]
    if search_term.blank?
      @events = Event.all.where('starts_at >= ?', Time.now)
    else
      @events = Event.all.where("lower(name) like ?", "%#{search_term.downcase}%")
    end 
    
  end

  def show
    @event = Event.find(params[:id])
  end
end
