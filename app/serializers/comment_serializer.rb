class CommentSerializer
  include JSONAPI::Serializer
  
  attributes :text, :user_id, :blog_id

  belongs_to :blog
  belongs_to :user
end
