class Post < ActiveRecord::Base
  attr_accessor :title, :content
  validates :title, presence: true
  validates :content, presence: true

end
