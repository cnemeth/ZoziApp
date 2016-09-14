require_relative '../../api/api_spec_helper'

RSpec.describe Api::V1::MessagesController, type: :request do
  describe "GET '/api/v1/messages'" do
    it 'sends a list of messages' do
      FactoryGirl.create_list(:message, 10)

      get '/api/v1/messages'

      json = JSON.parse(last_response.body)
      expect(last_response.status).to eq 200
      expect(json.count).to eq 10
    end
  end

   describe "POST /api/v1/messages" do
     describe "with valid params" do
       let(:params) {
         {
           message: {
             body: "This message is from #zozi"
           }
         }
       }

       it "creates a message" do
         post '/api/v1/messages', params
         expect(last_response.status).to eq 201
       end

       it "creates a new @message" do
         expect {
           post "/api/v1/messages", params
         }.to change{ Message.count }.by(1)
       end

       it "creates a new @tag for the message" do
         expect {
           post "/api/v1/messages", params
         }.to change{ Tag.count }.by(1)
         expect( Message.last.tags.last.tag).to eq '#zozi'
       end
     end
   end
end
