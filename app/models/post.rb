class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, :author_id, presence: true
end
