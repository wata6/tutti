# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  career          :string(255)
#  email           :string(255)
#  instrument      :string(255)
#  introduction    :string(255)
#  job             :string(255)
#  name            :string(255)
#  password_digest :string(255)
#  region          :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :posts
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :post
  
  def favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  
  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def favorite?(post)
    self.likes.include?(post)
  end
end
