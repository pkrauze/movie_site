class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!
  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.movie_id = params[:movie_id]
    
    if @comment.save
        redirect_to :back, notice: 'Your comment was successfully posted!'
      else
        redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :user_id)
  end
  
  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Movie.find_by_id(params[:movie_id]) if params[:movie_id]
  end 
  
  def create_comment_notification
    @comment = Comment.last
    Notification.create(comment_id: @comment_id, )
  end
end
