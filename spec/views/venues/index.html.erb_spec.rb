require 'rails_helper'

RSpec.describe "venues/index", type: :view do
  before(:each) do
    @venue1 = FactoryGirl.create :venue
    @venue2 = FactoryGirl.create :venue
    assign(:venues, [@venue1, @venue2])
  end

  it "renders a list of venues" do
    render
    assert_select "tr>td", text: @venue1.name
    assert_select "tr>td", text: @venue2.name
    assert_select "tr>td", text: @venue1.full_address, :count => 2
    assert_select "tr>td", text: @venue2.region.name, :count => 2
  end
end
