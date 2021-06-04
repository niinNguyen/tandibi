# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  coordinate :string           not null
#  locale     :string           not null
#  name       :string
#  place_type :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_places_on_coordinate             (coordinate)
#  index_places_on_locale                 (locale)
#  index_places_on_locale_and_coordinate  (locale,coordinate) UNIQUE
#
FactoryBot.define do
  factory :place do
    coordinate { "MyString" }
    name { "MyString" }
    place_type { "MyString" }
  end
end
