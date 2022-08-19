class Api::V1::ApiControllerCommentsController < ApiController
  skip_before_action :authenticate_request, only: [:index]
  before_action :set_comment, only: :destroy

  def index
    # TODO Add paginaiton
    if Blog.find(params[:blog_id]).status == "published"
      @comments = Comment.where(blog_id: params[:blog_id]).kept
      render json: CommentSerializer.new(@comments).serializable_hash.to_json, status: 200
    else 
      render json: "The article is not published".to_json, status: 401
    end 
  end 
  
  def create
    # @current_user.comments.create(comment_params)
    # comment = @current_user.comments.build(comments_params)
    params[:user_id] = @current_user.id
    @comment = Comment.create(comment_params)
    if @comment.save
      render json: CommentSerializer.new(@comment).serializable_hash.to_json, status: 200
    else 
      render json: "Sorry, your comment couldn't be saved unfortunately!".to_json, status: 401
    end 
  end

  def destroy
    if @comment.user_id == @current_user.id && @comment.undiscarded?
      @comment.discard
      render json: "Comment deleted successfully!".to_json, status: 200
    elsif @comment.user_id != @current_user.id
      render json: "You are not authorized to perform this action".to_json, status: 401
    else
      render json: "Comment deletion unsuccessful!".to_json, status: 401
    end 
  end
  
  private
    def set_comment
      @comment = Comment.find(params[:id])
    end 

    def comment_params
      params.permit(:text,:blog_id,:user_id)
    end 
end
