class Post < ApplicationRecord
  belongs_to :author, class_name: :User, foreign_key: :author_id
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, :author, presence: true


  has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150"}

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
