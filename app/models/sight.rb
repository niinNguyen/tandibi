# == Schema Information
#
# Table name: sights
#
#  id            :integer          not null, primary key
#  activity_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  place_id      :integer          not null
#
# Indexes
#
#  index_sights_on_place_id  (place_id)
#
# Foreign Keys
#
#  place_id  (place_id => places.id)
#
class Sight < ApplicationRecord
  belongs_to :place
  
  ACTIVITY_TYPE = [
    CHECKIN = 'checkin'.freeze,
    CHECKOUT = 'checkout'.freeze
  ].freeze

  validates :activity_type, presence: true, inclusion: { in: ACTIVITY_TYPE }
end
