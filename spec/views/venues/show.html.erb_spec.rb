require 'rails_helper'

RSpec.describe "venues/show", type: :view do
  before(:each) do
    @venue = assign(:venue, FactoryGirl.create(:venue))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include @venue.name
    expect(rendered).to include @venue.full_address
    expect(rendered).to include @venue.region.name
  end
end
