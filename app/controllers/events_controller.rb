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

  # GET /venues/new
  def new
    @event = Event.new
  end

  def create 
    @event = Event.new(event_params)

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

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event)
      .permit(:name, :starts_at, :ends_at, :hero_image_url, :extended_html_description, :category_id, :venue_id)
    end
end
