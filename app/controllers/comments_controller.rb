class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!
  def new
    @comment = Comment.new(movie_id: params[:movie_id])
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    
    if params[:movie_id].present?
      @comment.movie_id = params[:movie_id]
    else
      @comment.movie_id = params[:comment][:movie_id]
    end


    if @comment.save
      create_comment_notification
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :user_id, :movie_id)
  end
  
  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Movie.find_by_id(params[:movie_id]) if params[:movie_id]
  end 
  
  def create_comment_notification
    @commented_id = @comment.commentable_id
    @user_comments = Comment.where("user_id != ? ",current_user.id).find_by_id(@commented_id)
    
    if @user_comments
      Notification.create(user_id: @user_comments.user_id, comment_id: @comment.id, movie_id: @comment.movie_id, notification_type:"new comment", read: false)
    end
  end
end
