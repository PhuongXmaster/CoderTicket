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
      @ticket.user = current_user
      @ticket.ticket_type = TicketType.find(ticket_id)
      @ticket.quantity = quantity
      
      available_ticket = available_ticket @ticket.ticket_type
      if available_ticket < @ticket.quantity
        @ticket.errors.add :quantity, "Quantity cannot be greater than #{available_ticket}."  
        render :new
      elsif @ticket.save
          redirect_to root_path
      else
        render :new
      end
    end
  end

  helper_method :available_ticket
  def available_ticket ticket_type
    ticket_type.max_quantity - ticket_type.tickets.where(user: current_user).count
  end

  private
  def ticket_params
    params.require(:ticket).permit(:ticket_type, :quantity)
  end

end
