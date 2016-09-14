require 'rails_helper'

RSpec.describe MessagesHelper do
  describe "#tags_for" do
    let(:message) { Message.create(body: "This message is from #zozi with two #hashtags") }
    let(:tags) {
      [
        Tag.create(tag: '#zozi'),
        Tag.create(tag: '#hashtag')
      ]
    }

    before { message.tags = tags }

    it "returns the tags for the message in reverse chronological order" do
      expect(helper.tags_for(message)).to match_array ['#hashtag', '#zozi']
    end
  end
end
