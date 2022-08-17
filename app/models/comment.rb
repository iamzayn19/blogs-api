class Comment < ApplicationRecord
  include Discard::Model
  validates :text, presence: true
  belongs_to :blog
  belongs_to :user
end
