require 'rails_helper'

RSpec.describe Venue, type: :model do
  describe "validate" do    
    it { should validate_uniqueness_of(:name) }
  end

  describe "relationships" do 
    it { should belong_to :region }
  end
end
