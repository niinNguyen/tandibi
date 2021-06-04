# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer          not null
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
FactoryBot.define do
  factory :picture do
    post_id { "" }
    caption { "MyString" }
  end
end
