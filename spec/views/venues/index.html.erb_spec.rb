# require 'rails_helper'

# RSpec.describe "venues/index", type: :view do
#   before(:each) do
#     assign(:venues, [
#       Venue.create!(
#         :name => "Name",
#         :full_address => "Full Address",
#         :region => nil
#       ),
#       Venue.create!(
#         :name => "Name",
#         :full_address => "Full Address",
#         :region => nil
#       )
#     ])
#   end

#   it "renders a list of venues" do
#     render
#     assert_select "tr>td", :text => "Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Full Address".to_s, :count => 2
#     assert_select "tr>td", :text => nil.to_s, :count => 2
#   end
# end
