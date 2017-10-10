class Post < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, :author_id, presence: true

  attr_accessor :tag_names
  after_save :assign_tags

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end

  private
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
end
