class User < ActiveRecord::Base
  has_many :galleries
  has_many :images, through: :galleries
  has_many :comments, through: :images

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :likes
  has_many :liked_images, through: :likes, source: :image

  #has_many :tags, through: :images

  validates :email, presence: true, uniqueness: true # Makes sure that
  # users can only have one email address in the database.
  validates :password_digest, presence: true
  # pasword_digest makes sure the passwords are encrypted.

  def member?(group)
    groups.include?(group)
    #GroupMembershop.where(group_id: group.id, user_id: self.id).size > 0
  end

  def join(group)
    groups << group
  end

  def leave(group)
    groups.destroy(group)
  end

  def like(image)
    liked_images << image
  end

  def unlike(image)
    liked_images.destroy(image)
  end

  def like?(image)
    liked_images.include?(image)
  end
end
