class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket_type

  validate :check_quantity, :check_event_time

  def check_event_time
    if ticket_type.event.starts_at <= Time.now
      errors.add :ticket_type, "This event has started or already over."
    end
  end

  def check_quantity
    if quantity.blank?
      errors.add :quantity, "Quantity is required."
    elsif quantity <= 0 && quantity > 10
      errors.add :quantity, "Quantity must be from 1 to 10."
    elsif quantity > ticket_type.max_quantity
      errors.add :quantity, "Quantity cannot be greater than #{ticket_type.max_quantity}."
    end
  end
end
