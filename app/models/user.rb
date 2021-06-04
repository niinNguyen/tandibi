# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  first_name :string           not null
#  is_public  :boolean          default(TRUE), not null
#  last_name  :string
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email) UNIQUE
#  index_users_on_username  (username) UNIQUE
#
class User < ApplicationRecord
  validates :email, uniqueness: true, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'must be a valid email address'
  } # Check valid format of email
  validates :username, uniqueness: true
  validates :first_name, presence: true

  has_many :posts
  has_many :bonds

  has_many :inward_bonds,
           class_name: 'Bond',
           foreign_key: :friend_id

  has_many :followers,
           -> { where('bonds.state = ?', Bond::FOLLOWING)},
           through: :inward_bonds,
           source: :user

  has_many :followings,
           -> { Bond.following },
           through: :bonds,
           source: :friend

  has_many :follow_requests,
           -> { Bond.follow_request },
           through: :bonds,
           source: :friend

  has_many :followers,
           -> { Bond.following },
           through: :inward_bonds,
           source: :user
end
