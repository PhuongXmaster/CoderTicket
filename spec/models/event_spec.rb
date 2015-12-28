require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validate" do    
    it "name uniqueness" do
      unique_name = "Test event unique name"
      event1 = FactoryGirl.create(:event, name: unique_name)
      event2 = FactoryGirl.build(:event, name: unique_name)

      expect(event2).not_to be_valid
      expect(event2.errors[:name]).to match ["has already been taken"]

      event1.destroy
    end
  end
end
