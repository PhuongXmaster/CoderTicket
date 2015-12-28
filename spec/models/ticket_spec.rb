require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe "validate" do   
    it { should validate_presence_of(:ticket_type) }
    it { should validate_presence_of(:quantity) }
  end

  describe "validate quantity" do
    before do 
      @ticket = FactoryGirl.build(:ticket)
    end

    it "cannot less than 1" do 
      @ticket.quantity = 0
      expect(@ticket).not_to be_valid
      expect(@ticket).to have(1).errors_on :quantity
    end

    it "cannot greater than 10" do 
      @ticket.quantity = 11
      expect(@ticket).not_to be_valid
      expect(@ticket).to have(1).errors_on :quantity
    end

    it "can be less than 10" do 
      @ticket.quantity = 9
      expect(@ticket).to be_valid
    end

    it "cannot greater than max_quantity" do 
      @ticket.ticket_type = FactoryGirl.create(:ticket_type, max_quantity: 3)
      @ticket.quantity = 4
      expect(@ticket).not_to be_valid
      expect(@ticket).to have(1).errors_on :quantity
    end
  end

  describe "relationships" do 
    it { should belong_to :user }
    it { should belong_to :ticket_type }
  end
end
