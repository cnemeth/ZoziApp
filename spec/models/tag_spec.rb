# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  it { should have_and_belong_to_many(:message) }

  describe "tag" do
    describe "valid" do
      it "does not raise validation error" do
        expect{
          Tag.create!(tag: '#zozi')
        }.to_not raise_error
      end
    end

    describe "invalid" do
      it "raises validation error" do
        expect{
          Tag.create!(tag: 'zozi')
        }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
