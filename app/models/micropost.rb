class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :favo_users, through: :favorites, source: :user
  
  def favo(user)
    favorites.create(user_id: user.id)
  end
  
  def unfavo(user)
    favorites.find_by(user_id: user.id).destroy
  end
  
  def favo?(user)
    favo_users.include?(user)
  end
end