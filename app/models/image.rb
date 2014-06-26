class Image < ActiveRecord::Base # This is a model, representing an object in our system. Image is a model and gallery is a model
  belongs_to :gallery
  has_many :comments

  has_many :likes

  has_many :tags

  has_many :group_images
  has_many :groups, through: :group_images

  validates :url, presence: true
  validates :gallery, presence: true
end
