class Gallery < ActiveRecord::Base
  has_many :images

  validates :name, presence: true # Two lines because there are two columns. 
  validates :decription, presence: true
end