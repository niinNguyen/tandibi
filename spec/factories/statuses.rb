# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :status do
    text { "MyString" }
  end
end
