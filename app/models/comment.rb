class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  default_scope :order => 'comments.created_at DESC'
end
