class CommentSerializer
  include JSONAPI::Serializer
  
  attributes :text, :user_id, :blog_id
end
