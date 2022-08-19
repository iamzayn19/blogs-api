class User < ApplicationRecord
  include Discard::Model

  has_secure_password
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :blog_likes, dependent: :destroy
  
  enum user_type: {
                    author: 0,
                    public: 1
                  }, _suffix: true, _default: "public"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
end
