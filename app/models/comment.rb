class Comment < ActiveRecord::Base  # Without inheriting form active record, called a PORO.
  belongs_to :user
  belongs_to :image
  validates :body, presence: true
  def self.recent
    order(created_at: :desc)
  end

end
