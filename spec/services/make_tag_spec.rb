require 'rails_helper'

RSpec.describe MakeTag do

  describe "with one hashtag" do
    let(:message_with_one_hashtag) { Message.create(body: "This is a message from #zozi") }

    it "creates a @tag from the hashtag in the message" do
      expect{
        MakeTag.new(message_with_one_hashtag).call
      }.to change{Tag.count}.by(1)
    end
  end

  describe "with two hashtags" do
    let(:message_with_two_hashtags) { Message.create(body: "This is a message from #zozi with two #hashtags") }

    it "creates @tags from the hashtags in the message" do
      expect{
        MakeTag.new(message_with_two_hashtags).call
      }.to change{Tag.count}.by(2)
    end
  end

  describe "with repeated hashtags" do
    let(:message_with_two_hashtags) { Message.create(body: "This is a message from #zozi with two #zozi") }

    it "does not create multiple @tags from the repeated hashtags in the message" do
      expect{
        MakeTag.new(message_with_two_hashtags).call
      }.to change{Tag.count}.by(1)
    end
  end

  describe "existing @tag" do
    let(:message) { Message.create(body: "This is a message from #zozi") }
    let(:tag) { Tag.create(tag: '#zozi') }

    before { message.tags << tag }

    it "does not create duplicate but still assigns it to message" do
      expect{
        MakeTag.new(message).call
      }.to change{Tag.count}.by(0)
    end

    it "assigns @tag to @message" do
      expect( message.tags ).to include tag
    end
  end
end
