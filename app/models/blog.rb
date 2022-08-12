class Blog < ApplicationRecord
  include Discard::Model
  
  enum status: [ :agreed, :rejected, :published, :unpublished ], _default: "unpublished"
  belongs_to :user
  has_many_attached :images
end
