class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :ticket_type

  validate :check_quantity

  def check_quantity
    if quantity.blank?
      errors.add :quantity, "Quantity is required."
    elsif quantity <= 0
      errors.add :quantity, "Quantity must be greater than 0."
    elsif quantity > ticket_type.max_quantity
      errors.add :quantity, "Quantity cannot be greater than #{ticket_type.max_quantity}."
    end
  end
end
