class Post < ApplicationRecord
  validates :comment, presence: true
  belongs_to :user
  belongs_to :genre
  has_many :comments
  has_many :post_users

  # accepts_nested_attributes_for :post_images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :count

  def self.search(search)
    return Post.all unless search
    Post.where(['title LIKE ?', "%#{search}%"])
  end

end
