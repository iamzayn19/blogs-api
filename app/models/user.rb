class User < ApplicationRecord
  enum type: [ :author, :public ], _suffix: true
end
