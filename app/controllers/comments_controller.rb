class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @comment = Comment.new
  end

  def create
    if Comments::CreateComment.new(comment_params,current_user).call
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:body, :movie_id, :comment_id, :commentable_id)
  end
end
