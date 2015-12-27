class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :tickets

  def display_text
    "#{name} - #{ActionController::Base.helpers.number_to_currency(price, unit: 'VND', precision: 0)}"
  end
end
