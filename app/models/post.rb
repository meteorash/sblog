class Post < ActiveRecord::Base
  attr_accessible :title, :content

  validates :title, :presence => true, :length => {:minimum => 20, :maximum => 100}
  validates :content, :presence => true, :length => {:minimum => 100, :maximum => 2000}

  belongs_to :user
  has_many :comments

  default_scope :order => 'posts.created_at DESC'
end
