class User < ApplicationRecord
  include Discard::Model
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true

  has_many :blogs, dependent: :destroy
  has_many :comments,dependent: :destroy
  has_many :blog_likes, dependent: :destroy
  enum user_type: [ :author, :public ], _suffix: true, _default: "public"
  has_secure_password
end
