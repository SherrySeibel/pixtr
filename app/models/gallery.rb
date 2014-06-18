class Gallery < ActiveRecord::Base
  has_many :images

  validates :name, presence: true # Two lines because there are two columns in the table. 
  validates :description, presence: true
end