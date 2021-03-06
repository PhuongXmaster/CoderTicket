# require 'rails_helper'

# RSpec.describe TicketTypesController, type: :controller do

#   let(:valid_attributes) {
#     { name: "Test ticket", price: 10000, max_quantity: 10 } 
#   }

#   let(:invalid_attributes) {
#     { price: "abc", max_quantity: -10 }
#   }

#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # TicketTypesController. Be sure to keep this updated too.
#   let(:valid_session) { {} }

#   describe "GET #index" do
#     it "assigns all ticket_types as @ticket_types" do
#       ticket_type = TicketType.create! valid_attributes
#       get event_ticket_types_path, {}, valid_session
#       expect(assigns(:ticket_types)).to eq([ticket_type])
#     end
#   end

#   describe "GET #show" do
#     it "assigns the requested ticket_type as @ticket_type" do
#       ticket_type = TicketType.create! valid_attributes
#       get :show, {:id => ticket_type.to_param}, valid_session
#       expect(assigns(:ticket_type)).to eq(ticket_type)
#     end
#   end

#   describe "GET #new" do
#     it "assigns a new ticket_type as @ticket_type" do
#       get :new, {}, valid_session
#       expect(assigns(:ticket_type)).to be_a_new(TicketType)
#     end
#   end

#   describe "GET #edit" do
#     it "assigns the requested ticket_type as @ticket_type" do
#       ticket_type = TicketType.create! valid_attributes
#       get :edit, {:id => ticket_type.to_param}, valid_session
#       expect(assigns(:ticket_type)).to eq(ticket_type)
#     end
#   end

#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new TicketType" do
#         expect {
#           post :create, {:ticket_type => valid_attributes}, valid_session
#         }.to change(TicketType, :count).by(1)
#       end

#       it "assigns a newly created ticket_type as @ticket_type" do
#         post :create, {:ticket_type => valid_attributes}, valid_session
#         expect(assigns(:ticket_type)).to be_a(TicketType)
#         expect(assigns(:ticket_type)).to be_persisted
#       end

#       it "redirects to the created ticket_type" do
#         post :create, {:ticket_type => valid_attributes}, valid_session
#         expect(response).to redirect_to(TicketType.last)
#       end
#     end

#     context "with invalid params" do
#       it "assigns a newly created but unsaved ticket_type as @ticket_type" do
#         post :create, {:ticket_type => invalid_attributes}, valid_session
#         expect(assigns(:ticket_type)).to be_a_new(TicketType)
#       end

#       it "re-renders the 'new' template" do
#         post :create, {:ticket_type => invalid_attributes}, valid_session
#         expect(response).to render_template("new")
#       end
#     end
#   end

#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) {
#         skip("Add a hash of attributes valid for your model")
#       }

#       it "updates the requested ticket_type" do
#         ticket_type = TicketType.create! valid_attributes
#         put :update, {:id => ticket_type.to_param, :ticket_type => new_attributes}, valid_session
#         ticket_type.reload
#         skip("Add assertions for updated state")
#       end

#       it "assigns the requested ticket_type as @ticket_type" do
#         ticket_type = TicketType.create! valid_attributes
#         put :update, {:id => ticket_type.to_param, :ticket_type => valid_attributes}, valid_session
#         expect(assigns(:ticket_type)).to eq(ticket_type)
#       end

#       it "redirects to the ticket_type" do
#         ticket_type = TicketType.create! valid_attributes
#         put :update, {:id => ticket_type.to_param, :ticket_type => valid_attributes}, valid_session
#         expect(response).to redirect_to(ticket_type)
#       end
#     end

#     context "with invalid params" do
#       it "assigns the ticket_type as @ticket_type" do
#         ticket_type = TicketType.create! valid_attributes
#         put :update, {:id => ticket_type.to_param, :ticket_type => invalid_attributes}, valid_session
#         expect(assigns(:ticket_type)).to eq(ticket_type)
#       end

#       it "re-renders the 'edit' template" do
#         ticket_type = TicketType.create! valid_attributes
#         put :update, {:id => ticket_type.to_param, :ticket_type => invalid_attributes}, valid_session
#         expect(response).to render_template("edit")
#       end
#     end
#   end

#   describe "DELETE #destroy" do
#     it "destroys the requested ticket_type" do
#       ticket_type = TicketType.create! valid_attributes
#       expect {
#         delete :destroy, {:id => ticket_type.to_param}, valid_session
#       }.to change(TicketType, :count).by(-1)
#     end

#     it "redirects to the ticket_types list" do
#       ticket_type = TicketType.create! valid_attributes
#       delete :destroy, {:id => ticket_type.to_param}, valid_session
#       expect(response).to redirect_to(ticket_types_url)
#     end
#   end

# end
