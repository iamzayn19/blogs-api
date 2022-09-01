class BlogLike < ApplicationRecord
  include Discard::Model

  belongs_to :user
  belongs_to :blog
end
