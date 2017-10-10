class User < ApplicationRecord
  include BCrypt
  has_many :posts
  has_many :comments, through: :posts
  validates :name, :email, presence: true
  has_secure_password
end
