class User < ActiveRecord::Base
  has_many :galleries
  validates :email, presence: true, uniqueness: true # Makes sure that 
  # users can only have one email address in the database.
  validates :password_digest, presence: true 
  # pasword_digest makes sure the passwords are encrypted. 
end