class Tag < ActiveRecord::Base
  has_many :tag_lists
  has_many :images, through: :tag_lists

  validates :tag_name, presence: true, uniqueness: true
end
