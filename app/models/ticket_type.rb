class TicketType < ActiveRecord::Base
  belongs_to :event
  has_many :tickets

  validates :name, :price, :max_quantity, presence: true

  def display_text
    "#{name} - #{ActionController::Base.helpers.number_to_currency(price, unit: 'VND', precision: 0)}"
  end
end
