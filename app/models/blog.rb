class Blog < ApplicationRecord
  include Discard::Model

  belongs_to :user
  has_many :comments
  has_many :blog_likes
  has_many_attached :images

  enum status: {
                  agreed: 0,
                  rejected: 1,
                  published: 2,
                  unpublished: 3
                }, _default: "unpublished"

  def liked?(current_user)
    !!blog_likes.find { |like| like.user_id == current_user.id && like.kept? }
  end 
end
