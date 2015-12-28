require 'rails_helper'

RSpec.describe "venues/new", type: :view do
  before(:each) do
    assign(:venue, Venue.new)
  end

  it "renders new venue form" do
    render

    assert_select "form[action=?][method=?]", venues_path, "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_full_address[name=?]", "venue[full_address]"

      assert_select "select#venue_region_id[name=?]", "venue[region_id]"
    end
  end
end
