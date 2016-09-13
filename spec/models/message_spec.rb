# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Message, type: :model do
  it { should have_and_belong_to_many(:tag) }
  it { should validate_presence_of(:body) }
  it { should validate_length_of(:body).is_at_most(141) }
end
