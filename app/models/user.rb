class User < ApplicationRecord
  enum user_type: [ :author, :public ], _suffix: true
  has_secure_password
end
