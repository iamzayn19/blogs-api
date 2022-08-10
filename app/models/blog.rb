class Blog < ApplicationRecord
  enum status: [ :agreed, :rejected, :published, :unpublished ]
  belongs_to :user
end
