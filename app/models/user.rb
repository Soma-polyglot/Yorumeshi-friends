class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :post_users
  mount_uploader :image, ImageUploader

  # # validates
  # validates :email,                   presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # validates :password,                presence: true, length: {minimum: 6, maximum: 128}
end
