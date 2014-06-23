class Image < ActiveRecord::Base # This is a model, representing an object in our system. Image is a model and gallery is a model
  belongs_to :gallery
  has_many :comments
  validates :url, presence: true
  validates :gallery, presence: true
end
