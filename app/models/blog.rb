class Blog < ApplicationRecord
  include Discard::Model

  enum status: [ :agreed, :rejected, :published, :unpublished ], _default: "unpublished"
  belongs_to :user
  has_many :comments
  has_many :blog_likes 
  has_many_attached :images

  def liked?
    !!self.post_likes.find { |like| like.user_id == @current_user.id }
  end 
end
