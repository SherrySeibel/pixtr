class User < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries
  has_many :comments, through: :images

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  validates :email, presence: true, uniqueness: true # Makes sure that
  # users can only have one email address in the database.
  validates :password_digest, presence: true
  # pasword_digest makes sure the passwords are encrypted.

  def member?(group)
    group_ids.include?(group.id)
    #GroupMembershop.where(group_id: group.id, user_id: self.id).size > 0
  end
end
