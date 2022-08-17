class Comment < ApplicationRecord
  include Discard::Model

  belongs_to :blog
  belongs_to :user

  validates :text, presence: true
end
