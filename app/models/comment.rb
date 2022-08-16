class Comment < ApplicationRecord
  include Discard::Model
  
  belongs_to :blog
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true
end
