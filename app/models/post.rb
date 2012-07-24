class Post < ActiveRecord::Base
  attr_accessible :title, :content, :user_id
  validates :title, presence: true
  validates :content, presence: true
  
  scope :recent, order("created_at DESC").limit(5)

end
