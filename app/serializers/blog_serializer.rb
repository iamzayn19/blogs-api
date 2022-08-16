class BlogSerializer
  include JSONAPI::Serializer

  attributes :title, :body, :comments, :post_likes, :user

end
