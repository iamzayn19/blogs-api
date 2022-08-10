class User < ApplicationRecord
  has_many :blogs
  enum user_type: [ :author, :public ], _suffix: true
  has_secure_password
end
