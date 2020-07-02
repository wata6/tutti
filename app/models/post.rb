# == Schema Information
#
# Table name: posts
#
#  id                     :bigint           not null, primary key
#  content                :string(255)
#  instrument_requirement :string(255)
#  region                 :string(255)
#  title                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :bigint
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :region, presence: true
  validates :content, presence: true, length: { maximum: 255 }
end
