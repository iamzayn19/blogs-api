class BlogSerializer
  include JSONAPI::Serializer

  attributes :title, :body
  
  attribute :user do |blog|
    UserSerializer.new(blog.user).as_json['data']
  end

  attribute :blog_likes do |blog|
    BlogLikeSerializer.new(blog.blog_likes).as_json['data']
  end 
end
