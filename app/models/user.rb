class User < ApplicationRecord
  include Discard::Model
  
  has_many :blogs
  enum user_type: [ :author, :public ], _suffix: true, _default: "public"
  has_secure_password
end
