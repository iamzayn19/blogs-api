class BlogSerializer
  include JSONAPI::Serializer
  attributes :title, :body
  
  belongs_to :user
  has_many :comments
  has_many :blog_likes 
  has_many_attached :images
end
