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
require 'rails_helper'

RSpec.describe User, type: :model do
  def create_a_user(email: "#{SecureRandom.hex(4)}@gmail.com")
    User.create!(
      first_name: 'test',
      email: email,
      username: SecureRandom.hex(4)
    )
  end

  describe '#valid?' do
    it "is valid when email is unique" do
      create_a_user
      user = User.new
      user.email = 'lala@best.com'
      expect(user.valid?).to be true
    end

    it "is valid if user's first name is blank" do
      user = create_a_user
      expect(user).to be_valid

      user.first_name = ''
      expect(user).not_to be_valid

      user.first_name = nil
      expect(user).not_to be_valid
    end
  end

end
