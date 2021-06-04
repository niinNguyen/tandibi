# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  is_public              :boolean          default(TRUE), not null
#  last_name              :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
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
