# == Schema Information
#
# Table name: bonds
#
#  id         :integer          not null, primary key
#  state      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_bonds_on_user_id_and_friend_id  (user_id,friend_id) UNIQUE
#
# Foreign Keys
#
#  friend_id  (friend_id => users.id)
#  user_id    (user_id => users.id)
#
class Bond < ApplicationRecord
  STATES = [
    REQUESTING = 'requesting'.freeze,
    FOLLOWING = 'following'.freeze,
    BLOCKING = 'blocking'.freeze
  ].freeze

  validates :state, inclusion: { in: STATES }

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  scope :following, -> { where(state: FOLLOWING) }
  scope :follow_request, -> { where(state: REQUESTING) }
  scope :blocking, -> { where(state: BLOCKING) }
end
