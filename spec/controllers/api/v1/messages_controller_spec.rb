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
end
