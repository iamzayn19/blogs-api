class User < ApplicationRecord
  include Discard::Model

  has_many :blogs
  has_many :comments 
  has_many :blog_likes
  enum user_type: [ :author, :public ], _suffix: true, _default: "public"
  has_secure_password
end
