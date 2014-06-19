class Gallery < ActiveRecord::Base
  has_many :images
  belongs_to :user # inverse relationship based on foreign key found on galleries.
  # we are now giving gallery a user method. 

  validates :name, presence: true # Two lines because there are two columns in the table. 
  validates :description, presence: true
end