# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  postable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  postable_id   :integer          not null
#  thread_id     :integer
#  user_id       :integer
#
# Indexes
#
#  index_posts_on_postable  (postable_type,postable_id)
#
# Foreign Keys
#
#  thread_id  (thread_id => posts.id)
#  user_id    (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
