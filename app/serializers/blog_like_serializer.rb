class BlogLikeSerializer
  include JSONAPI::Serializer
  attributes :user_id, :blog_id

  belongs_to :user
  belongs_to :blog
end
