# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :body, :tags, :created_at, :updated_at
end
