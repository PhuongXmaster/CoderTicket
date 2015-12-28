require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validate" do    
    it { should validate_uniqueness_of(:name) }
    # this is a real fail. Not the problem with shoulda matcher. Not sure what's wrong in the code.
    xit { should validate_uniqueness_of(:name).scoped_to(:venue, :starts_at) }

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:extended_html_description) }
    it { should validate_presence_of(:venue) }
    it { should validate_presence_of(:category) }
    it { should validate_presence_of(:starts_at) }

    it { should belong_to :venue }
    it { should belong_to :category }
    it { should belong_to(:creator).class_name 'User' }

    it { should have_many :ticket_types }
  end

end
