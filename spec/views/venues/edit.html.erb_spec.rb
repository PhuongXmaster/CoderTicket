require 'rails_helper'

RSpec.describe "venues/edit", type: :view do
  before(:each) do
    @venue = assign(:venue, Venue.create!(
      :name => "MyString",
      :full_address => "MyString",
      :region => nil
    ))
  end

  it "renders the edit venue form" do
    render

    assert_select "form[action=?][method=?]", venue_path(@venue), "post" do

      assert_select "input#venue_name[name=?]", "venue[name]"

      assert_select "input#venue_full_address[name=?]", "venue[full_address]"

      assert_select "input#venue_region_id[name=?]", "venue[region_id]"
    end
  end
end
