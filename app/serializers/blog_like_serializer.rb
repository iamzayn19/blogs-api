class BlogLikeSerializer
  include JSONAPI::Serializer
  attributes :user_id, :blog_id, :user,:blog
end
