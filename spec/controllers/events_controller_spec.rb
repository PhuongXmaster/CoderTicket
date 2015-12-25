require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the events into @events" do
      event1, event2 = FactoryGirl.create(:event), FactoryGirl.create(:event)
      get :index
      expect(assigns(:events)).to match_array([event1, event2])
    end
    
    it "loads only upcoming events into @events" do
      event1, event2 = FactoryGirl.create(:event, starts_at: 1.day.ago), FactoryGirl.create(:event)
      get :index
      expect(assigns(:events)).to eq [event2]
    end

    it "can search events by name" do
      event1, event2 = FactoryGirl.create(:event, name: "Hello world"), FactoryGirl.create(:event, name: "Test")
      get :index, search: "test"
      expect(assigns(:events)).to eq [event2]
    end
  end
end
