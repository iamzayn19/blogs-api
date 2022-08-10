class User < ApplicationRecord
  enum type: [ :author, :public ], _suffix: true
  has_secure_password
end
