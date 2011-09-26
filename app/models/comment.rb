class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :body, :presence => true, :length => {:minimum => 10, :maximum => 100}

  default_scope :order => 'comments.created_at DESC'
end
