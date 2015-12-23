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

    it "loads all of the posts into @posts" do
      post1, post2 = Event.create!, Event.create!
      get :index

      expect(assigns(:posts)).to match_array([post1, post2])
    end
    
    it "loads only today's posts into @posts" do
      post1, post2 = Event.create!(ends_at: 1.day.ago), Event.create!
      get :index

      expect(assigns(:posts)).to eq [post2]
    end
    
    it "redirect to /login" do
      expect(get :index).to redirect_to("/login")
    end
  end
end
