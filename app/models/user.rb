class User < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries
  has_many :comments, through: :images

  validates :email, presence: true, uniqueness: true # Makes sure that
  # users can only have one email address in the database.
  validates :password_digest, presence: true
  # pasword_digest makes sure the passwords are encrypted.
end
