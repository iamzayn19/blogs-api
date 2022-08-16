class UserSerializer
  include JSONAPI::Serializer
  attributes :first_name, :user_type, :last_name, :email

  has_many :blogs
  has_many :comments 
  has_many :blog_likes
end