class EventsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :has_event_published, only: [:show]

  def index
    search_term = params[:search]
    if search_term.blank?
      @events = Event.all.where('starts_at >= ? AND has_published = true', Time.now)
    else
      @events = Event.all.where("lower(name) like ? AND has_published = true", "%#{search_term.downcase}%")
    end 
    
  end

  def show
  end

  # GET /venues/new
  def new
    @event = Event.new
  end

  def create 
    @event = Event.new(event_params)
    @event.creator = current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Venue was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end 

  def publish
    @event = Event.find(params[:event_id])

    if @event.ticket_types.empty?
      redirect_to event_path(@event), alert: "Cannot publish an event without any ticket types."
    else 
      @event.has_published = true
      @event.save
      redirect_to action: "show", id: params[:event_id]  
    end
  end

  def myevents
    @events = current_user.events
    render :index
  end

  def edit 
  end

  def update 
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def has_event_published
    redirect_to events_path, notice: 'This event is not published yet.' unless @event.has_published || is_event_creator
  end

  helper_method :is_event_creator
  def is_event_creator
    @event.creator == current_user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event)
      .permit(:name, :starts_at, :ends_at, :hero_image_url, :extended_html_description, :category_id, :venue_id)
    end
end
