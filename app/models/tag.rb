# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_and_belongs_to_many :messages, join_table: :messages_tags

  validates :tag,
    uniqueness: true,
    format: { with: /\A\#{1}\w+\z/,
              message: "tags must start with '#'" }
end
