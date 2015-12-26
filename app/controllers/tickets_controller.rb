class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket = Ticket.new

    ticket_id = ticket_params['ticket_type']
    quantity = ticket_params['quantity']

    if ticket_id.blank?
      @ticket.errors.add :ticket_type, "Please select a ticket type."  
      render :new
    else 
      @ticket.ticket_type = TicketType.find(ticket_id)
      @ticket.user = current_user
      @ticket.quantity = quantity

      if @ticket.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  private
  def ticket_params
    params.require(:ticket).permit(:ticket_type, :quantity)
  end

end
