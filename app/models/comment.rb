class Comment < ApplicationRecord
  include Discard::Model
  
  belongs_to :blog
  belongs_to :user
end
