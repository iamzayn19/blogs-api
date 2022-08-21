class Api::V1::CommentsController < Api::V1::ApiController
  skip_before_action :authenticate_request, only: [:index]
  before_action :set_comment, only: :destroy
  after_action { pagy_headers_merge(@pagy) if @pagy }
  def index
    # TODO Add paginaiton

    if Blog.find(params[:blog_id]).published?
      @pagy, comments = pagy(Comment.where(blog_id: params[:blog_id]).kept,items: 5)
      render json: CommentSerializer.new(comments), status: 200
    else 
      render json: "The article is not published", status: 401
    end 
  end 
  
  def create
    comment = @current_user.comments.create(comment_params)
    if comment.save
      render json: CommentSerializer.new(comment), status: 200
    else 
      render json: "Sorry, your comment couldn't be saved unfortunately!", status: 401
    end 
  end

  def destroy
    if comment.user_id == @current_user.id && comment.undiscarded?
      comment.discard
      render json: "Comment deleted successfully!", status: 200
    elsif @comment.user_id != @current_user.id
      render json: "You are not authorized to perform this action", status: 401
    else
      render json: "Comment deletion unsuccessful!", status: 401
    end 
  end
  
  private
    def set_comment
      comment = Comment.find(params[:id])
    end 

    def comment_params
      params.permit(:text,:blog_id,:user_id)
    end 
end
