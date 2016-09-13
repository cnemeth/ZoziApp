# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  has_and_belongs_to_many :tag

  validates :body, presence: true, length: { maximum: 141 }
end
