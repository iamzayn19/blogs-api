class User < ApplicationRecord
  include Discard::Model

  has_many :blogs
  has_many :comments 
  has_many :blog_likes
  enum user_type: [ :author, :general ], _default: "general"
  has_secure_password
end
